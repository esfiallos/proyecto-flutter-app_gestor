import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          
          Positioned(
            top: -100,
            left: -100,
            child: _circle(220, Colors.purple),
          ),

          Positioned(
            top: -80,
            right: -80,
            child: _circle(180, Colors.blue),
          ),
          Positioned(
            top: -20,
            right: -20,
            child: _circle(60, Colors.pink),
          ),

          Positioned(
            bottom: -10,
            left: -20,
            child: _circle(50, Colors.pink),
          ),
          Positioned(
            bottom: -80,
            left: 20,
            child: _circle(160, Colors.purple),
          ),

          Positioned(
            bottom: -60,
            right: -60,
            child: _circle(150, Colors.blue),
          ),

          // CONTENIDO CENTRAL
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // TEXTO CON GRADIENTE
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.blue, Colors.purple, Colors.pink],
                  ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: const Text(
                    'Hasta Luego!',
                    style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.7),
        shape: BoxShape.circle,
      ),
    );
  }
}