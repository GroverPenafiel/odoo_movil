import 'package:odoo_movil/providers/auth_odoo_provider.dart';
import 'package:odoo_movil/providers/login_form_provider.dart';
import 'package:odoo_movil/ui/buttons/custom_outlined_button.dart';
import 'package:odoo_movil/ui/inputs/custom_inputs.dart';
import 'package:odoo_movil/ui/shared/widgets/csbp_cargando.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthOdooProvider>(context);
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: true);
        return Container(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xfffefefe), Color(0xffacacac)]),
                  borderRadius: BorderRadius.circular(10),
                  //color: Color(0xFFfafafa),
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: size.width > 400 && size.width < 500
                            ? 300
                            : (size.width <= 400 ? 240 : 370)), //370
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: loginFormProvider.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: size.width <= 400 ? 50 : 50),
                          Text(
                            'Nombre de usuario',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(color: Color(0xFF393939)),
                          ),
                          SizedBox(height: 7),
                          TextFormField(
                            onFieldSubmitted: (_) =>
                                onFormSubmit(loginFormProvider, authProvider),
                            onChanged: (value) =>
                                loginFormProvider.email = value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingrese nombre de usuario';
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: CustomInputs.loginInputDecoration(
                                hint: 'Ingrese su nombre de usuario',
                                label: 'Nombre de usuario',
                                icon: Icons.person_outline),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Contraseña',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(color: Color(0xFF393939)),
                          ),
                          SizedBox(height: 7),
                          TextFormField(
                            onFieldSubmitted: (_) =>
                                onFormSubmit(loginFormProvider, authProvider),
                            onChanged: (value) =>
                                loginFormProvider.password = value,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Ingrese su contraseña';
                              if (value.length < 3)
                                return 'La contraseña debe tener minimo 6 caracteres';
                              return null;
                            },
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: CustomInputs.loginInputDecoration(
                                hint: '*******',
                                label: 'Contraseña',
                                icon: Icons.lock_outline),
                          ),
                          SizedBox(height: 20),
                          CustomOutlinedButton(
                            onPressed: () =>
                                onFormSubmit(loginFormProvider, authProvider),
                            text: 'Ingresar',
                            color: Color(0xFF00193f),
                            isFilled: true,
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CSBPCargando(cargando: authProvider.cargando),
            ],
          ),
        );
      }),
    );
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthOdooProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid)
      authProvider.login(
        loginFormProvider.email,
        loginFormProvider.password,
      );
  }
}
