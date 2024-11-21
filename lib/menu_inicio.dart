import 'package:flutter/material.dart';
import 'package:math/videos.dart';
//import 'package:video_player/video_player.dart';

class MenuInicio extends StatefulWidget {
  const MenuInicio({super.key});

  @override
  State<MenuInicio> createState() => _MenuInicioState();
}

class _MenuInicioState extends State<MenuInicio> {
  // Variables de estado para el hover de cada botón
  bool _isHoveringMath = false;
  bool _isHoveringGames = false;
  bool _isHoveringTutorials = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Quitar la flecha de retroceso
        elevation: 0, // Quitar el sombreado
        backgroundColor: const Color(0xff89375F), // Mismo color que los botones
        centerTitle: true, // Centrar el texto del AppBar
        actions: [
          TextButton.icon(
            onPressed: () {
              // Lógica para cerrar sesión
              Navigator.of(context)
                  .pop(); // Ejemplo: salir de la pantalla actual
            },
            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text(
              "Cerrar sesión",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xffF9FBE7),
              Color(0xffF0EDD4),
              Color(0xffECCDB4),
              Color(0xffFEA1A1),
              Color(0xffD14D72),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              menuButton(
                context,
                label: 'Actividades Matemáticas',
                icon: Icons.calculate,
                onPressed: () {
                  // Acción para "Actividades Matemáticas"
                },
                isHovering: _isHoveringMath,
                onHover: (hovering) {
                  setState(() {
                    _isHoveringMath = hovering;
                  });
                },
              ),
              const SizedBox(height: 20),
              menuButton(
                context,
                label: 'Minijuegos',
                icon: Icons.videogame_asset,
                onPressed: () {
                  // Acción para "Minijuegos"
                },
                isHovering: _isHoveringGames,
                onHover: (hovering) {
                  setState(() {
                    _isHoveringGames = hovering;
                  });
                },
              ),
              const SizedBox(height: 20),
              menuButton(
                context,
                label: 'Tutoriales en Video',
                icon: Icons.video_library,
                onPressed: () {
                  // Acción para "Tutoriales en Video"
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoListScreen(),
                    ),
                  );
                },
                isHovering: _isHoveringTutorials,
                onHover: (hovering) {
                  setState(() {
                    _isHoveringTutorials = hovering;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required bool isHovering,
    required void Function(bool) onHover,
  }) {
    return SizedBox(
      width: 300,
      height: 60,
      child: InkWell(
        onTap: onPressed,
        onHover: onHover,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color:
                isHovering ? const Color(0xff632D4D) : const Color(0xff89375F),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
