import 'package:flutter/material.dart';
import 'package:math/login.dart';

class Registrarse extends StatefulWidget {
  static String id = "Registrarse";

  @override
  _RegistrarseState createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _createAccount(BuildContext context) {
    final name = _nameController.text;
    final emailPhone = _emailPhoneController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password == confirmPassword) {
      // Aquí podrías agregar la lógica para guardar la cuenta (por ejemplo, en una base de datos)
      print("Cuenta creada: $name, $emailPhone, $password");
      // NAVEGA A LA PANTALLA INICIO DE SESIÓN
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Las contraseñas no coinciden')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Color(0xffF9FBE7),
              Color(0xffF0EDD4),
              Color(0xffECCDB4),
              Color(0xffFEA1A1),
              Color(0xffD14D72),
            ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Registrate y aprende',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 38,
                        color: Color(0xff89375F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 35.0),
                  _textFieldNombre(),
                  SizedBox(height: 25.0),
                  _textFieldNumeroCorreo(),
                  SizedBox(height: 25.0),
                  _textFieldPassword(),
                  SizedBox(height: 25.0),
                  _textAgainPassword(),
                  SizedBox(height: 20.0),
                  buttonSignUp(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldNombre() {
    return _textFieldGeneral(
      controller: _nameController,
      labelText: 'Nombre y Apellido',
      icon: Icons.person_outlined,
      keyboardType: TextInputType.text,
    );
  }

  Widget _textFieldNumeroCorreo() {
    return _textFieldGeneral(
      controller: _emailPhoneController,
      labelText: 'Número de teléfono o correo electrónico',
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email_outlined,
    );
  }

  Widget _textFieldPassword() {
    return _textFieldGeneral(
      controller: _passwordController,
      labelText: 'Contraseña',
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.lock_outline_rounded,
      obscureText: true,
    );
  }

  Widget _textAgainPassword() {
    return _textFieldGeneral(
      controller: _confirmPasswordController,
      labelText: 'Vuelve a escribir la contraseña',
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.lock_outline_rounded,
      obscureText: true,
    );
  }

  Widget buttonSignUp(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: ElevatedButton(
        onPressed: () => _createAccount(context),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Color(0xFF6A0DAD); // Color cuando está presionado
              }
              return Color(0xFF893075F); // Color normal
            },
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 15.0),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        child: Text(
          'Continuar',
          style: TextStyle(
            color: Color(0xffF0EDD4),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class _textFieldGeneral extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final IconData icon;
  final bool obscureText;

  const _textFieldGeneral({
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        color: const Color(0xffFEA1A1),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon,
              color:
                  const Color.fromARGB(255, 49, 49, 49)), // Icono color morado
          labelText: labelText,
          labelStyle: TextStyle(
              color: const Color.fromARGB(
                  255, 47, 47, 47)), // Color del texto del label
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(13),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: const Color.fromARGB(255, 255, 255, 255), width: 2.0),
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }
}
