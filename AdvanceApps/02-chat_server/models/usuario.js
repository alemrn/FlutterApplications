const { Schema, model } = require("mongoose");

const UsuarioSchema = Schema({
  nombre: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },
  online: {
    type: Boolean,
    default: false,
  },
});

UsuarioSchema.method("toJSON", function () {
  // JS es CaseSensitive
  const { __v, _id, password, ...object } = this.toObject(); // Instancia del objeto creado en el momento
  object.uid = _id;
  return object;
});

module.exports = model("Usuario", UsuarioSchema);
