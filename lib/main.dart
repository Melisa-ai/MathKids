/*import 'package:flutter/material.dart';
import 'package:math/login.dart';

class Login extends StatefulWidget {
  const Login({super.key})

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
            Color(0xffF9FBE7),
            Color(0xffF0EDD4),
            Color(0xffECCDB4),
            Color(0xffFEA1A1),
          ],
          ),
        ),
      ),
    );
  }
  }*/

import 'package:flutter/material.dart';
import 'package:math/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
      },
    );
  }
}
// QUEDÓ MINUTO 13:45 O ALGO ASÍ
