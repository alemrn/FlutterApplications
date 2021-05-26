const mongoose = require("mongoose");

const dbConnection = async () => {
  try {
    await mongoose.connect(process.env.DB_CNN, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
      useCreateIndex: true,
    });
    console.log("DBOnline");
  } catch (error) {
    console.log(error);
    throw new error("Error en la base de datos - hable con el admin");
  }
};

module.exports = {
  dbConnection,
};
