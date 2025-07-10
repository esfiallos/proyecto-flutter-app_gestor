import 'package:flutter/material.dart';

class creacionCuenta extends StatelessWidget {
  const creacionCuenta({super.key});

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
                    color: Color(0xFF8A2BE2), // Morado
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
                    color: Color(0xFF007BFF), // Azul
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Contenido principal
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      // Titulo 
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

                      // Imagen 
                      Center(
                        child: Image.asset(
                        'assets/creacionCuenta.jpg',
                        height: 220,
                        ),
                        ),

                      const SizedBox(height: 24),

                      // Campos de entrada
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

                      _buildLabel("WHATSAPP"),
                      const TextField(
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 20),

                      _buildLabel("INSTAGRAM"),
                      const TextField(
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

                      // Boton
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Accion al presionar el boton
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

  // Metodo para crear etiquetas alineadas
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
