import 'package:flutter/material.dart';
import 'restablecerContrasena.dart';

class buscarCorreo extends StatelessWidget {
  const buscarCorreo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned(
                top: -140,
                left: -140,
                child: Container(
                  height: 280,
                  width: 280,
                  decoration: const BoxDecoration(
                    color: Color(0xFF8A2BE2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              Positioned(
                bottom: -120,
                right: -120,
                child: Container(
                  height: 280,
                  width: 280,
                  decoration: const BoxDecoration(
                    color: Color(0xFF007BFF),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Center(
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Color(0xFF007BFF),
                              Color(0xFF8A2BE2),
                            ],
                          ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                          child: const Text(
                            'Buscar Correo',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Image.asset(
                          'assets/BuscarCorreo.jpg',
                          height: 300,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "Escriba su correo",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const restablecerContrasena()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF007BFF),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text(
                            "Confirmar",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
