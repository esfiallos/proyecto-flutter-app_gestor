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
      _mostrarDialogo('Error', 'Por favor completa todos los campos.');
      return;
    }

    final existente = await _service.obtenerCorreoPorCorreo(correo);
    if (existente != null) {
      _mostrarDialogo('Correo en uso', 'Este correo ya está registrado.');
      return;
    }

    final nuevoUsuario = Usuario(
      nombre: nombre,
      apellido: apellido,
      correo: correo,
      contrasena: contrasena,
    );

    await _service.registrarUsuario(nuevoUsuario);

    if (!mounted) return;

    // Mostrar mensaje de éxito y esperar confirmación del usuario
    _mostrarDialogo(
      'Cuenta creada',
      'Tu cuenta fue creada con éxito.',
  onAceptar: () {
   Navigator.of(context).pop(); // cerrar el diálogo primero
    Navigator.pushReplacementNamed(context, '/login'); // navegar al login
  },
    );
  }

  void _mostrarDialogo(String titulo, String mensaje, {VoidCallback? onAceptar}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              if (onAceptar != null) {
                onAceptar();
              }
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _apellidoCtrl.dispose();
    _correoCtrl.dispose();
    _contrasenaCtrl.dispose();
    super.dispose();
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