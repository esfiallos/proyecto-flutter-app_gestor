import 'package:flutter/material.dart';
import 'package:miki/models/usuario.dart';
import 'package:miki/service/super_service.dart';

class CreacionCuentaScreen extends StatefulWidget {
  const CreacionCuentaScreen({super.key});

  @override
  State<CreacionCuentaScreen> createState() => _CreacionCuentaScreenState();
}

class _CreacionCuentaScreenState extends State<CreacionCuentaScreen> {
  final _nombreCtrl = TextEditingController();
  final _apellidoCtrl = TextEditingController();
  final _correoCtrl = TextEditingController();
  final _contrasenaCtrl = TextEditingController();

  final AppService _service = AppService();

  void _registrarUsuario() async {
    final nombre = _nombreCtrl.text.trim();
    final apellido = _apellidoCtrl.text.trim();
    final correo = _correoCtrl.text.trim();
    final contrasena = _contrasenaCtrl.text;

    if (nombre.isEmpty || apellido.isEmpty || correo.isEmpty || contrasena.isEmpty) {
      _mostrarMensaje('Por favor completa todos los campos.');
      return;
    }

    final existente = await _service.obtenerCorreoPorCorreo(correo);
    if (existente != null) {
      _mostrarMensaje('Este correo ya está registrado.');
      return;
    }

    final nuevoUsuario = Usuario(
      nombre: nombre,
      apellido: apellido,
      correo: correo,
      contrasena: contrasena,
    );

    await _service.registrarUsuario(nuevoUsuario);

    _mostrarMensaje('Cuenta creada con éxito.');
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Cuenta')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: _nombreCtrl,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _apellidoCtrl,
              decoration: const InputDecoration(labelText: 'Apellido'),
            ),
            TextField(
              controller: _correoCtrl,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: _contrasenaCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _registrarUsuario,
              child: const Text('Crear Cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}