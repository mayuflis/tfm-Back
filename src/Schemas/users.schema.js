const zod = require("zod");

const validateRegister = zod.object({
  nombre: zod
    .string({
      required_error: "Name is required",
    })
    .min(2, { message: "Must be 2 or more characters long" }),
  apellidos: zod.string({
    required_error: " Apellidos must be required",
    invalid_type_error: "Apellidos must be a string",
  }),
  fechaNacimiento: zod.coerce.date({
    required_error: "Please select a date and time",
    invalid_type_error: "That's not a date!",
  }),

  provincia: zod.number(),
  telefono: zod
    .string({
      required_error: "Please telephone must be required",
      invalid_type_error: "That's not a string",
    })
    .min(9)
    .max(15),
  email: zod
    .string({
      required_error: "Email is required",
      invalid_type_error: "Email must be a string",
    })
    .email({
      message: "Invalid email address",
    }),
  password: zod
    .string({
      required_error: "The password must be required",
      invalid_type_error: "The password must be a string",
    })
    .min(6, { message: " Must be 6 or more characters long" }),
  rol: zod.enum(["Alumno", "Profesor", "admin"]),
  longitude: zod.number().optional(),
  latitude: zod.number().optional(),
});

function registerValidate(object) {
  return validateRegister.parseAsync(object);
}

function loginvalidate(object) {
  return validateRegister.partial().parseAsync(object);
}

module.exports = { registerValidate, loginvalidate };
