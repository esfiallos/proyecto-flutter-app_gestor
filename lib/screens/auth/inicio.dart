import 'package:flutter/material.dart'; 

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  void initState() {
    super.initState();

    // Espera 10 segundos y navega a la pantalla de bienvenida
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
          Navigator.pushReplacementNamed(context, '/bienvenida');
      }
    });
  }

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

          // Logo centrado
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 180,
                  width: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.blue, Colors.purple, Colors.pink],
                  ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  blendMode: BlendMode.srcIn,
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
        color: color.withAlpha(10),
        shape: BoxShape.circle,
      ),
    );
  }
}