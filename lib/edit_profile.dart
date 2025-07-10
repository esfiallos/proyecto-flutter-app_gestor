import 'package:flutter/material.dart';

class Edit_Profile extends StatelessWidget {
  const Edit_Profile({super.key});

  @override
  Widget build(BuildContext context) {
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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar más pequeño
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                radius: 40, 
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                backgroundColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 12), 

            
            _buildProfileTextField(
              label: 'Nombre',
              initialValue: ' ',
              fontSizeLabel: 14,
              fontSizeText: 14,
              heightTextField: 38,
            ),
            const SizedBox(height: 8),

            _buildProfileTextField(
              label: 'Correo',
              initialValue: ' ',
              keyboardType: TextInputType.emailAddress,
              fontSizeLabel: 14,
              fontSizeText: 14,
              heightTextField: 38,
            ),
            const SizedBox(height: 8),

            _buildProfileTextField(
              label: 'WhatsApp:',
              initialValue: ' ',
              keyboardType: TextInputType.phone,
              fontSizeLabel: 14,
              fontSizeText: 14,
              heightTextField: 38,
            ),
            const SizedBox(height: 8),

            _buildProfileTextField(
              label: 'Instagram:',
              initialValue: ' ',
              fontSizeLabel: 14,
              fontSizeText: 14,
              heightTextField: 38,
            ),
            const SizedBox(height: 8),

            _buildProfileTextField(
              label: 'Ubicación:',
              initialValue: ' ',
              fontSizeLabel: 14,
              fontSizeText: 14,
              heightTextField: 38,
            ),
            const SizedBox(height: 16),

            
            SizedBox(
              width: 180,
              height: 40, 
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
                child: const Text(
                  'Guardar Cambios',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildProfileTextField({
    required String label,
    required String initialValue,
    TextInputType keyboardType = TextInputType.text,
    double fontSizeLabel = 16,
    double fontSizeText = 16,
    double heightTextField = 45,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSizeLabel,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: heightTextField,
          child: TextField(
            controller: TextEditingController(text: initialValue),
            keyboardType: keyboardType,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            style: TextStyle(
              fontSize: fontSizeText,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}