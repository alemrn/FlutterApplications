/*
    path = /api/login
*/

const { Router, response } = require("express");
const { check } = require("express-validator");
const { crearUsuario } = require("../controllers/auth");
const { validarCampos } = require("../middleware/validar-campos");

const router = Router();

router.post(
  "/new",
  [
    check("nombre", "El nombre es obligatorio").not().isEmpty(),
    check("email", "El correo es obligatorio").not().isEmpty(),
    check("email", "El correo tiene que ser valido").normalizeEmail().isEmail(),
    check(
      "password",
      "La contraseña tiene que ser mayor a 6 carácteres y contener mayúsculas, minúsculas y números"
    )
      .isLength({ min: 6 })
      .matches(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/),
    validarCampos,
  ],
  crearUsuario
);

module.exports = router;
