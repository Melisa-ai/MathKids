import 'dart:math';
import 'package:flutter/material.dart';

class FractionAdditionActivity extends StatefulWidget {
  @override
  _FractionAdditionActivityState createState() =>
      _FractionAdditionActivityState();
}

class _FractionAdditionActivityState extends State<FractionAdditionActivity> {
  late int numerator1;
  late int denominator1;
  late int numerator2;
  late int denominator2;

  String currentImage = "assets/bien.png"; // Imagen inicial

  // Lista de imágenes
  final List<String> images = [
    "assets/bien.png",
    "assets/bien.png",
  ];

  @override
  void initState() {
    super.initState();
    _generateFractionProblem();
  }

  void _generateFractionProblem() {
    final random = Random();
    numerator1 = random.nextInt(5) + 1; // Numeradores del 1 al 5
    denominator1 = random.nextInt(5) + 1; // Denominadores del 1 al 5
    numerator2 = random.nextInt(5) + 1;
    denominator2 = denominator1; // Mismo denominador para suma simple
  }

  bool _validateAnswer(String userAnswer) {
    // Calcular el resultado correcto
    int resultNumerator = numerator1 + numerator2;
    int resultDenominator = denominator1;

    // Verificar si la respuesta es un decimal correcto
    double correctDecimal = resultNumerator / resultDenominator;
    if (double.tryParse(userAnswer) == correctDecimal) {
      return true;
    }

    // Verificar si la respuesta es una fracción correcta
    if (userAnswer.contains('/')) {
      List<String> parts = userAnswer.split('/');
      if (parts.length == 2) {
        int? userNumerator = int.tryParse(parts[0]);
        int? userDenominator = int.tryParse(parts[1]);

        if (userNumerator != null &&
            userDenominator != null &&
            userNumerator * resultDenominator ==
                userDenominator * resultNumerator) {
          return true;
        }
      }
    }

    // Si no coincide, es incorrecta
    return false;
  }

  void _changeImage() {
    final random = Random();
    setState(() {
      currentImage = images[random.nextInt(images.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController answerController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFCE38A), Color(0xffF38181)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Encabezado
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.pie_chart, size: 40, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Suma de Fracciones",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Problema de fracción
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 4),
                    )
                  ],
                ),
                child: Text(
                  "$numerator1/$denominator1 + $numerator2/$denominator2 = ?",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Campo para la respuesta
              TextField(
                controller: answerController,
                decoration: InputDecoration(
                  labelText: "Escribe tu respuesta (Decimal o Fracción)",
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),

              // Botón de enviar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  String userAnswer = answerController.text.trim();
                  if (_validateAnswer(userAnswer)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 10),
                            Text("¡Correcto! 🎉"),
                          ],
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                    setState(() {
                      _generateFractionProblem();
                      _changeImage();
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.error, color: Colors.red),
                            SizedBox(width: 10),
                            Text("Respuesta incorrecta. Inténtalo de nuevo."),
                          ],
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text(
                  "Enviar",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),

              // Imagen dinámica
              Expanded(
                child: Image.asset(
                  currentImage, // Imagen que cambia
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
