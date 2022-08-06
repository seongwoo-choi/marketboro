const express = require("express");
const helmet = require("helmet");
const cors = require("cors");
const xss = require("xss-clean");

require("dotenv").config();

const sequelize = require("./database/database");
const User = require("./models/user");

const authRoute = require("./routes/authRoute")

const app = express();

app.use(express.json());
app.use(helmet());
app.use(cors());
app.use(xss());

app.use("/api/v2/auth", authRoute);
app.get("/api/v2/health", (req, res, next) => {
    res.status(200).json({ msg: "health check" });
})

app.use((error, req, res, next) => {
    const status = error.statusCode || 500;
    const msg = error.message;
    const data = error.data;

    res.status(status).json({ status, data, msg });
})

const start = async () => {
    try {
        await sequelize.sync();
        // await sequelize.sync({ force: true });
        app.listen(process.env.PORT || 8080);
    } catch(err) {
        console.log(err);
    }
}

start();