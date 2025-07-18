import 'package:flutter/material.dart';


class CreacionCuenta extends StatelessWidget {
  const CreacionCuenta({super.key});

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
                top: -100,
                left: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xFF8A2BE2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom: -80,
                right: -80,
                child: Container(
                  height: 200,
                  width: 200,
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
                      const SizedBox(height: 20),
                      Center(
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Color(0xFF007BFF),
                              Color(0xFF8A2BE2),
                            ],
                          ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                          child: const Text(
                            'Crear Cuenta',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Image.asset(
                          'assets/creacionCuenta.jpg',
                          height: 220,
                        ),
                      ),
                      const SizedBox(height: 24),

                      _buildLabel("NOMBRES"),
                      const TextField(
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 20),

                      _buildLabel("APELLIDOS"),
                      const TextField(
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 20),

                      _buildLabel("CORREO"),
                      const TextField(
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 20),

                      _buildLabel("DESCRIPCIÓN BREVE"),
                      const TextField(
                        maxLines: 2,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 20),


                      _buildLabel("CONTRASEÑA"),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.visibility_off),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF007BFF),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text(
                            "Crear Cuenta",
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

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
