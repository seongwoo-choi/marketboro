const { validationResult } = require("express-validator");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const crypto = require("crypto");
const User = require("../models/user")

require("dotenv").config();

exports.signup = async (req, res, next) => {
    try {
        const errors = validationResult(req);
        if(!errors.isEmpty()) {
            const error = new Error("Invalid Data");
            error.statusCode = 422;
            error.data = errors.array();
            throw error;
        }
        const { email, password } = req.body;
        let signupToken;

        const checkEmail = await User.findOne({ where: { email } });

        if (checkEmail) {
            const error = new Error(`${email} is already registered`);
            error.statusCode = 422;
            throw error;
        }

        crypto.randomBytes(64, (err, buf) => {
            crypto.pbkdf2(email, buf.toString('base64'), 100000, 64, 'sha512', (err, key) => {
                signupToken = key.toString('base64');
            })
        })

        const hashPwd = await bcrypt.hash(password, 12);
        const user = await User.create({
            email,
            password: hashPwd,
            signupToken: signupToken,
            status: true
        });

        res.status(201).json({ id: user.id, msg: "user created successfully" });

    } catch (error) {
        next(error);
    }
}

exports.signin = async (req, res, next) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ where: { email } });

        const status = user.status;

        if (!user) {
            const error = new Error("User Not Found");
            error.statusCode = 403;
            throw error;
        }

        const isPwd = await bcrypt.compare(password, user.password);

        if (!isPwd) {
            const error = new Error("Invalid password");
            error.statusCode = 403;
            throw error;
        }

        const token = jwt.sign(
            { email: email, userId: user.id, isAdmin: user.isAdmin },
            process.env.SECRET_KEY,
            { expiresIn: "1h" }
        );

        res
            .status(200)
            .json({ msg: "login successful", token: token, userId: user.id, status });
    } catch (error) {
        next(error);
    }
}