import 'package:flutter/material.dart';
import 'package:miki/service/super_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/usuario.dart'; 


class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nombreController;
  late TextEditingController correoController;
  late TextEditingController whatsappController;
  late TextEditingController instagramController;
  late TextEditingController ubicacionController;

  Usuario? usuario;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('user_id');
    if (id != null) {
      final usuarioCargado = await AppService().obtenerUsuarioPorId(id);
      if (usuarioCargado != null) {
        setState(() {
          usuario = usuarioCargado;
          nombreController = TextEditingController(text: usuario!.nombre);
          correoController = TextEditingController(text: usuario!.correo);
          whatsappController = TextEditingController(text: usuario!.whatsapp ?? '');
          instagramController = TextEditingController(text: usuario!.instagram ?? '');
          ubicacionController = TextEditingController(text: usuario!.ubicacion ?? '');
        });
      }
    }
  }

  Future<void> _guardarCambios() async {
    if (usuario == null) return;

    Usuario actualizado = Usuario(
      id: usuario!.id,
      nombre: nombreController.text,
      apellido: usuario!.apellido, // Suponiendo que no se edita aquí
      correo: correoController.text,
      contrasena: usuario!.contrasena,
      whatsapp: whatsappController.text,
      instagram: instagramController.text,
      imagenPerfil: usuario!.imagenPerfil,
      pais: usuario!.pais,
      ubicacion: ubicacionController.text,
    );

    await AppService().actualizarUsuario(actualizado);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Perfil actualizado correctamente")),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (usuario == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Editar Perfil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField('Nombre', nombreController),
            const SizedBox(height: 10),
            _buildTextField('Correo', correoController, keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 10),
            _buildTextField('WhatsApp', whatsappController, keyboardType: TextInputType.phone),
            const SizedBox(height: 10),
            _buildTextField('Instagram', instagramController),
            const SizedBox(height: 10),
            _buildTextField('Ubicación', ubicacionController),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: _guardarCambios,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  'Guardar Cambios',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}