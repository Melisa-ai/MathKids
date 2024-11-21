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

  const ActivityButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 64, 64),
          borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// Pantallas de ejemplo para cada actividad

/*class SimpleAdditionActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sumas Normales')),
      body: Center(
        child: Text(
          'Aquí van las actividades de sumas normales',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}*/

