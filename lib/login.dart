import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/menu_inicio.dart';
import 'package:math/registrarse.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    //Logo de la app
                    Image.asset(
                      'assets/logo_sinFondo.png', //PONER LA IMAGEN DEL LOGO 1
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 20),

                    //Hola
                    Text(
                      'Bienvenid@',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 48,
                        color: const Color(0xff89375F),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '¡Aprende con Math Funny!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff89375F),
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 30),

                    //correo textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFEA1A1),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'correo',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //contraseña textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFEA1A1),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'contraseña',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    //Boton de entrar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuInicio()),
                          );
                        },
                        onHover: (isHovering) {
                          setState(() {
                            _isHovering = isHovering;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: _isHovering
                                ? Color.fromARGB(255, 213, 93,
                                    165) // Color oscuro cuando está presionado o en hover
                                : Color(0xff89375F), //Color normal
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                color: Color(0xffF0EDD4),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    //No registrado
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '¿Aún no tiene una cuenta?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff893075F),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registrarse()),
                            );
                          },
                          child: const Text(
                            ' Regístrese aquí',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
