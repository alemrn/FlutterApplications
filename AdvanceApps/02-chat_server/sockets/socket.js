//import io package or io module from index
const { io } = require("../index");

console.log("Init server");

// Sockets messages
io.on("connection", (client) => {
  console.log("Connected");

  client.on("disconnect", () => {
    console.log("Client Disconnected");
  });
});
