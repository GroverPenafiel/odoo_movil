import 'package:odoo_movil/providers/register_form_provider.dart';
import 'package:odoo_movil/router/router.dart';
import 'package:odoo_movil/ui/buttons/custom_outlined_button.dart';
import 'package:odoo_movil/ui/buttons/link_text.dart';
import 'package:odoo_movil/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);
        return Container(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF26272b),
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        'Nombre de usuario',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(color: Colors.white54),
                      ),
                      SizedBox(height: 7),
                      TextFormField(
                        onChanged: (value) =>
                            registerFormProvider.username = value,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Ingrese el nombre de usuario';

                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Ingrese su nombre',
                            label: 'Nombre',
                            icon: Icons.verified_user),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Correo Electrónico',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(color: Colors.white54),
                      ),
                      SizedBox(height: 7),
                      TextFormField(
                        onChanged: (value) =>
                            registerFormProvider.email = value,
                        validator: (value) {
                          if (value == null || !value.contains('@')) {
                            return 'Email no valido';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Ingrese su correo',
                            label: 'Email',
                            icon: Icons.mail),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Password',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(color: Colors.white54),
                      ),
                      SizedBox(height: 7),
                      TextFormField(
                        onChanged: (value) =>
                            registerFormProvider.password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Ingrese su contraseña';
                          if (value.length < 6)
                            return 'La contraseña debe tener minimo 6 caracteres';
                          return null;
                        },
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: '*******',
                            label: 'Contraseña',
                            icon: Icons.lock_clock_outlined),
                      ),
                      SizedBox(height: 20),
                      CustomOutlinedButton(
                        onPressed: () {
                          registerFormProvider.validateForm();
                        },
                        text: 'Crear cuenta',
                        //color: Colors.greenAccent,
                        //isFilled: true,
                      ),
                      SizedBox(height: 20),
                      LinkText(
                        text: 'ir al login',
                        color: Colors.white54,
                        onPressed: () {
                          Navigator.pushNamed(context, Flurorouter.loginRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
