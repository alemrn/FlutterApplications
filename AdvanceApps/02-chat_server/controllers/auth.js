const { response } = require("express");
const bcrypt = require("bcryptjs"); // Encriptar las contraseñas
const Usuario = require("../models/usuario.js");
const { generarJWT } = require("../helpers/jwt.js");

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

    // Encriptar contraseñas

    const salt = bcrypt.genSaltSync();
    usuario.password = bcrypt.hashSync(password, salt);

    await usuario.save();

    // Generar JWT
    const token = await generarJWT(usuario.id);
    res.json({
      ok: true,
      usuario,
      token,
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      msg: "Hable con el administrador",
    });
  }
};

const loginUsuario = async (req, res = response) => {
  const { email, password, nombre } = req.body;
  try {
    const usuarioDB = await Usuario.findOne({ email });
    if (!usuarioDB) {
      return res.status(400).json({
        ok: false,
        msg: "El correo no está registrado",
      });
    }
    const valid_password = bcrypt.compareSync(password, usuarioDB.password);

    if (!valid_password) {
      return res.status(400).json({
        ok: false,
        msg: "La contraseña no es valida",
      });
    }
    const token = await generarJWT(usuarioDB.id);
    res.json({
      ok: true,
      existeEmail: usuarioDB,
      token,
    });
    // Generar JWT
  } catch (error) {
    console.log(error);
    res.status(500).json({
      ok: false,
      msg: "Hable con el administrador",
    });
  }
};

const renewToken = async (req, res = response) => {
  // uid => const uid uid del usuario
  // Genera un nuevo JWT
  // Obtener el usuario por el uid, Usuario, FindById({})

  const uid = req.uid;
  const token = await generarJWT(uid);
  const usuario = await Usuario.findById(uid);
  res.json({
    ok: true,
    usuario,
    token,
  });
};

module.exports = { crearUsuario, loginUsuario, renewToken };
