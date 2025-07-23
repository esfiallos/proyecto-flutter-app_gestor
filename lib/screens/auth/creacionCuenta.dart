import 'package:flutter/material.dart';
import 'package:miki/service/super_service.dart';
import 'package:miki/models/usuario.dart';

class CreacionCuenta extends StatefulWidget {
  const CreacionCuenta({super.key});

  @override
  State<CreacionCuenta> createState() => _CreacionCuentaState();
}

class _CreacionCuentaState extends State<CreacionCuenta> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  final AppService _service = AppService();

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _correoController.dispose();
    _descripcionController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }

  Future<void> _registrarCuenta() async {
    if (_nombreController.text.isEmpty ||
        _correoController.text.isEmpty ||
        _contrasenaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, llena los campos obligatorios")),
      );
      return;
    }

    final nuevoUsuario = Usuario(
      nombre: _nombreController.text.trim(),
      apellido: _apellidoController.text.trim(),
      correo: _correoController.text.trim(),
      contrasena: _contrasenaController.text.trim(),
      imagenPerfil: '',
      whatsapp: '',
      instagram: '',
      pais: '',
      ubicacion: _descripcionController.text.trim(),
    );

    try {
      final id = await _service.registrarUsuario(nuevoUsuario);

      if (id > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Cuenta creada exitosamente")),
        );
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error al crear cuenta")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
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
                      TextField(
                        controller: _nombreController,
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 20),

                      _buildLabel("APELLIDOS"),
                      TextField(
                        controller: _apellidoController,
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 20),

                      _buildLabel("CORREO"),
                      TextField(
                        controller: _correoController,
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 20),

                      _buildLabel("DESCRIPCIÓN BREVE"),
                      TextField(
                        controller: _descripcionController,
                        maxLines: 2,
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 20),

                      _buildLabel("CONTRASEÑA"),
                      TextField(
                        controller: _contrasenaController,
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
                          onPressed: _registrarCuenta,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF007BFF),
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
}