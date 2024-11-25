import 'package:flutter/material.dart';
import 'package:math/ActividadMultiplicacion.dart';
import 'package:math/ActividadResta.dart';
import 'package:math/ActividadSuma.dart';
import 'package:math/OperacionesBasicas.dart';

class ActividadesMatematicas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades Matemáticas'),
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
            ActivityButton(
              title: 'Suma de fracciones',
              backgroundImage: 'assets/fondo_suma.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FractionAdditionActivity(),
                  ),
                );
              },
            ),
            ActivityButton(
              title: 'Resta de fracciones',
              backgroundImage: 'assets/fondo_resta.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FractionSubtractionActivity(),
                  ),
                );
              },
            ),
            ActivityButton(
              title: 'Multiplicación de fracciones',
              backgroundImage: 'assets/fondo_multiplicacion.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActividadMultiplicacion(),
                  ),
                );
              },
            ),
            ActivityButton(
              title: 'Operaciones básicas',
              backgroundImage: 'assets/fondo_operaciones.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OperacionesBasicas(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String backgroundImage;

  const ActivityButton({
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
            image: AssetImage(backgroundImage),
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
