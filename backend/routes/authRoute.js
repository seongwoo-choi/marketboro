const express = require("express");
const { body, check } = require("express-validator");

const authController = require("../controller/authController");

const router = express.Router();

router.post("/signin", [
    body("email").trim().isEmail().withMessage("Invalid email"),
    body("password")
        .trim()
        .isLength({ min: 5 })
        .isAlphanumeric()
        .withMessage("Invalid password"),
], authController.signin);
router.post("/signup",[
    body("email").trim().isEmail().withMessage("Invalid email"),
    body("password")
        .trim()
        .isLength({ min: 5 })
        .isAlphanumeric()
        .withMessage("Invalid password"),
], authController.signup);

module.exports = router;