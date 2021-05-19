//import io package or io module from index
const { io } = require("../index");
const Bands = require("../models/bands");
const Band = require("../models/band");

const bands = new Bands();
console.log("Init server");

bands.addBand(new Band("Queen"));
bands.addBand(new Band("Bon Jovi"));
bands.addBand(new Band("Heroes del silencio"));
bands.addBand(new Band("Metallica"));

console.log(bands);
// Sockets messages
io.on("connection", (client) => {
  console.log("Connected");

  client.emit("active-bands", bands.getBands());

  client.on("disconnect", () => {
    console.log("Client Disconnected");
  });

  client.on("message", (message) => {
    console.log("Mensaje!!!", message);
    io.emit("message", { admin: "New message" });
  });

  client.on("new-message", (message) => {
    io.emit("new-message", message);
  });

  client.on("vote-band", (payload) => {
    console.log(payload);
    bands.voteBand(payload.id);
    io.emit("active-bands", bands.getBands());
  });

  client.on("add-band", (payload) => {
    console.log(payload);
    bands.addBand(new Band(payload.name));
    io.emit("active-bands", bands.getBands());
  });

  client.on("delete-band", (payload) => {
    console.log(payload);
    bands.deleteBand(payload.id);
    io.emit("active-bands", bands.getBands());
  });
});
