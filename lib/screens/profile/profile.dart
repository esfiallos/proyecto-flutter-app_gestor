import 'package:flutter/material.dart';
import 'package:miki/service/super_service.dart';
import 'package:miki/widgets/MenuBar.dart';
import 'package:miki/models/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Usuario? _usuario;
  final AppService _appService = AppService();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _cargarUsuario();
  }

  Future<void> _cargarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('id_usuario');
    if (userId != null) {
      Usuario? usuario = await _appService.obtenerUsuarioPorId(userId);
      if (usuario != null) {
        setState(() {
          _usuario = usuario;
          _loading = false;
        });
        return;
      }
    }
    // Si no hay usuario cargado, quitar loader igual
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_usuario == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Menu Usuario'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: const Center(child: Text('Usuario no encontrado')),
      );
    }

    final usuario = _usuario!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu Usuario',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      bottomNavigationBar: const MenuBarraAbajo(currentIndex: 4),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            CircleAvatar(
              radius: 50,
              backgroundImage: usuario.imagenPerfil != null && usuario.imagenPerfil!.isNotEmpty
                  ? NetworkImage(usuario.imagenPerfil!)
                  : const NetworkImage('https://placehold.co/120x120/000000/FFFFFF/png?text=Perfil'),
              backgroundColor: Colors.black,
            ),
            const SizedBox(height: 5),

            _buildInfoRow(Icons.person, 'Nombre: ${usuario.nombre} ${usuario.apellido}'),
            const SizedBox(height: 5),

            if (usuario.pais != null && usuario.pais!.trim().isNotEmpty)
              _buildInfoRow(Icons.public, 'País: ${usuario.pais}'),
            if (usuario.ubicacion != null && usuario.ubicacion!.trim().isNotEmpty)
              _buildInfoRow(Icons.location_on, 'Ubicación: ${usuario.ubicacion}'),
            if ((usuario.pais != null && usuario.pais!.trim().isNotEmpty) ||
                (usuario.ubicacion != null && usuario.ubicacion!.trim().isNotEmpty))
              const SizedBox(height: 5),

            _buildInfoRow(Icons.email, 'Correo: ${usuario.correo}'),
            const SizedBox(height: 5),

            if (usuario.whatsapp != null && usuario.whatsapp!.trim().isNotEmpty)
              _buildInfoRow(Icons.phone, 'WhatsApp: ${usuario.whatsapp}'),
            if (usuario.whatsapp != null && usuario.whatsapp!.trim().isNotEmpty)
              const SizedBox(height: 5),

            if (usuario.instagram != null && usuario.instagram!.trim().isNotEmpty)
              _buildInfoRow(Icons.camera_alt, 'Instagram: ${usuario.instagram}'),
            if (usuario.instagram != null && usuario.instagram!.trim().isNotEmpty)
              const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  _buildCard(
                    icon: Icons.person_outline,
                    title: 'Editar Perfil',
                    subtitle: 'Información del usuario',
                    route: '/editar-perfil',
                  ),
                  _buildCard(
                    icon: Icons.description_outlined,
                    title: 'Ver Mis Productos',
                    subtitle: 'Mira tus productos',
                    route: '/MyProducts',
                  ),
                  _buildCard(
                    icon: Icons.logout,
                    title: 'Cerrar Sesión',
                    subtitle: '',
                    route: '/log-out',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blueGrey[800], size: 24),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String route,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[700]),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          Navigator.pushReplacementNamed(context, route);
        },
      ),
    );
  }
}