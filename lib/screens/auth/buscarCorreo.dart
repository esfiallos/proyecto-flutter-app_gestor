import 'package:flutter/material.dart';
import 'package:miki/service/super_service.dart';

class BuscarCorreoScreen extends StatefulWidget {
  const BuscarCorreoScreen({super.key});

  @override
  State<BuscarCorreoScreen> createState() => _BuscarCorreoScreenState();
}

class _BuscarCorreoScreenState extends State<BuscarCorreoScreen> {
  final _correoCtrl = TextEditingController();
  final AppService _service = AppService();

  void _verificarCorreo() async {
    final correo = _correoCtrl.text.trim();
    if (correo.isEmpty) {
      _mostrarMensaje('Ingresa tu correo.');
      return;
    }

    final usuario = await _service.obtenerCorreoPorCorreo(correo);
    if (usuario == null) {
      _mostrarMensaje('Correo no encontrado.');
    } else {
      Navigator.pushNamed(context, '/restablecer', arguments: usuario);
    }
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recuperar Cuenta')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _correoCtrl,
              decoration: const InputDecoration(labelText: 'Correo registrado'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verificarCorreo,
              child: const Text('Verificar correo'),
            ),
          ],
        ),
      ),
    );
  }
}
