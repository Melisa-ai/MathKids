import 'dart:math';
import 'package:flutter/material.dart';

class OperacionesBasicas extends StatefulWidget {
  @override
  _OperacionesBasicasState createState() => _OperacionesBasicasState();
}

class _OperacionesBasicasState extends State<OperacionesBasicas> {
  late int num1;
  late int num2;
  late String operation;
  late int correctAnswer;
  String currentImage = "assets/bien.png"; // Imagen inicial

  // Lista de imágenes
  final List<String> images = [
    "assets/bien.png",
    "assets/mal.png",
  ];

  @override
  void initState() {
    super.initState();
    _generateProblem();
  }

  void _generateProblem() {
    final random = Random();
    num1 = random.nextInt(10) + 1; // Números del 1 al 10
    num2 = random.nextInt(10) + 1;
    final operations = ['+', '-', '*'];
    operation = operations[random.nextInt(operations.length)];

    switch (operation) {
      case '+':
        correctAnswer = num1 + num2;
        break;
      case '-':
        correctAnswer = num1 - num2;
        break;
      case '*':
        correctAnswer = num1 * num2;
        break;
    }
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
                  Icon(Icons.calculate, size: 40, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "¡Operaciones Básicas!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Problema matemático
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
                  "$num1 $operation $num2 = ?",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Campo para la respuesta
              TextField(
                controller: answerController,
                decoration: InputDecoration(
                  labelText: "Escribe tu respuesta",
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.number,
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
                  if (int.tryParse(answerController.text.trim()) ==
                      correctAnswer) {
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
                      _generateProblem();
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

              // Imagen que cambia
              Expanded(
                child: Image.asset(
                  currentImage, // Imagen dinámica
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
