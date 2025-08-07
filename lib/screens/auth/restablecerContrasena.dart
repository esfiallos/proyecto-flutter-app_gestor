import 'package:flutter/material.dart';
import 'package:miki/models/usuario.dart';
import 'package:miki/service/super_service.dart';


class RestablecerContrasenaScreen extends StatefulWidget {
  final Usuario usuario;

  const RestablecerContrasenaScreen({super.key, required this.usuario});

  @override
  State<RestablecerContrasenaScreen> createState() => _RestablecerContrasenaScreenState();
}

class _RestablecerContrasenaScreenState extends State<RestablecerContrasenaScreen> {
  final TextEditingController _nuevaCtrl = TextEditingController();
  final AppService _service = AppService();

  @override
  void dispose() {
    _nuevaCtrl.dispose();
    super.dispose();
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  void _cambiarContrasena() async {
    final nueva = _nuevaCtrl.text.trim();

    if (nueva.isEmpty) {
      _mostrarMensaje('Escribe una nueva contraseña.');
      return;
    }

    final actualizado = widget.usuario.copyWith(contrasena: nueva);
    await _service.actualizarUsuario(actualizado);

    // Esperar un segundo para que el usuario vea el mensaje
    await Future.delayed(const Duration(seconds: 1));

    // Navegar al login
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restablecer Contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Restablece la contraseña de:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(widget.usuario.correo, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: _nuevaCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Nueva Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _cambiarContrasena,
              child: const Text('Cambiar Contraseña'),
            ),
          ],
        ),
      ),
    );
  }
}