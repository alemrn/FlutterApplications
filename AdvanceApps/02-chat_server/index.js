const express = require("express");
const path = require("path");
require("dotenv").config();

// db config

const { dbConnection } = require("./database/config");
dbConnection();

// App de express
const app = express();

// CONFIGURAR LA LECTURA DE UNA PETICIÓN HTTP
// LECTURA Y PARSEO DEL BODY

app.use(express.json());

// Node server
const server = require("http").createServer(app);
// Export io module
module.exports.io = require("socket.io")(server);
require("./sockets/socket");

// Path public
const publicPath = path.resolve(__dirname, "public");

app.use(express.static(publicPath));

//Mis rutas
app.use("/api/login", require("./routes/auth"));

server.listen(process.env.PORT, (err) => {
  if (err) throw new Error(err);
  console.log("Servidor corriendo en puerto ", process.env.PORT);
});
