import 'package:flutter/material.dart';

class MinijuegosScreen extends StatelessWidget {
  final List<Map<String, String>> juegos = [
    {
      'title': 'Juego 1: Suma de Números',
      'route': '/juego1',
      'gif': 'assets/suma.gif'
    },
    {
      'title': 'Juego 2: Multiplicación Rápida',
      'route': '/juego2',
      'gif': 'assets/Multiplicacion.gif'
    },
    {
      'title': 'Juego 3: Rompecabezas de Matemáticas',
      'route': '/juego3',
      'gif': 'assets/rompecabezas.gif'
    },
    {
      'title': 'Juego 4: Resta Rápida',
      'route': '/juego4',
      'gif': 'assets/resta.gif'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minijuegos Matemáticos'),
        backgroundColor: const Color.fromARGB(255, 255, 98, 41),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xffF9FBE7),
              Color(0xffF0EDD4),
              Color(0xffECCDB4),
              Color(0xffFEA1A1),
              Color(0xffD14D72),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2, // Dos botones por fila
          crossAxisSpacing: 20.0, // Espaciado horizontal entre botones
          mainAxisSpacing: 20.0, // Espaciado vertical entre botones
          padding: const EdgeInsets.all(20.0),
          children: [
            MinijuegoButton(
              title: 'Suma de Números',
              backgroundImage: 'assets/suma.gif',
              onPressed: () {
                Navigator.pushNamed(context, '/juego1');
              },
            ),
            MinijuegoButton(
              title: 'Multiplicación Rápida',
              backgroundImage: 'assets/Multiplicacion.gif',
              onPressed: () {
                Navigator.pushNamed(context, '/juego2');
              },
            ),
            MinijuegoButton(
              title: 'Rompecabezas de Matemáticas',
              backgroundImage: 'assets/rompecabezas.gif',
              onPressed: () {
                Navigator.pushNamed(context, '/juego3');
              },
            ),
            MinijuegoButton(
              title: 'Resta Rápida',
              backgroundImage: 'assets/resta.gif',
              onPressed: () {
                Navigator.pushNamed(context, '/juego4');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MinijuegoButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String backgroundImage;

  const MinijuegoButton({
    required this.title,
    required this.onPressed,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(backgroundImage), // GIF como fondo
            fit: BoxFit.cover, // Ajusta la imagen al contenedor
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 2,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
