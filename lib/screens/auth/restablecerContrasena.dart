import 'package:flutter/material.dart';
import 'package:miki/models/usuario.dart';
import 'package:miki/service/super_service.dart';

class RestablecerContrasenaScreen extends StatefulWidget {
  const RestablecerContrasenaScreen({super.key});

  @override
  State<RestablecerContrasenaScreen> createState() => _RestablecerContrasenaScreenState();
}

class _RestablecerContrasenaScreenState extends State<RestablecerContrasenaScreen> {
  final _nuevaCtrl = TextEditingController();
  final AppService _service = AppService();

  late Usuario usuario;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    usuario = ModalRoute.of(context)!.settings.arguments as Usuario;
  }

  void _cambiarContrasena() async {
    final nueva = _nuevaCtrl.text;
    if (nueva.isEmpty) {
      _mostrarMensaje('Escribe una nueva contraseña.');
      return;
    }

    final actualizado = Usuario(
      id: usuario.id,
      nombre: usuario.nombre,
      apellido: usuario.apellido,
      correo: usuario.correo,
      contrasena: nueva,
      whatsapp: usuario.whatsapp,
      instagram: usuario.instagram,
      imagenPerfil: usuario.imagenPerfil,
      pais: usuario.pais,
      ubicacion: usuario.ubicacion,
    );

    await _service.actualizarUsuario(actualizado);
    _mostrarMensaje('Contraseña actualizada.');
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
      appBar: AppBar(title: const Text('Nueva Contraseña')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nuevaCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Nueva contraseña'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _cambiarContrasena,
              child: const Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }
}