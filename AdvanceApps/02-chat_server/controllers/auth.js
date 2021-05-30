const { response } = require("express");
const Usuario = require("../models/usuario.js");

const crearUsuario = async (req, res = response) => {
  const { email, password, nombre } = req.body; //Desestructuración

  try {
    const existeEmail = await Usuario.findOne({ email });
    if (existeEmail) {
      return res.status(400).json({
        ok: false,
        msg: "El correo ya está registrado",
      });
    }
    const usuario = new Usuario(req.body);
    await usuario.save();

    res.json({
      ok: true,
      usuario,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      msg: "Hable con el administrador",
    });
  }
};

module.exports = { crearUsuario };
