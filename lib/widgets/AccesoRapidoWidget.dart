import 'package:flutter/material.dart';

class AccesoRapidoWidget extends StatelessWidget {
  final String imagen;
  final String texto;
  final String? ruta;
  final VoidCallback? onPressed;

  const AccesoRapidoWidget({super.key, 
                  required this.imagen, 
                  required this.texto,
                  this.ruta, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed ??
    () {
      if (ruta != null) {
        Navigator.pushNamed(context, ruta!);
      } else {
        // Si no se proporciona ruta, podrías mostrar algo
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Ruta no disponible")),
        );
      }
    },

          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            backgroundColor: const Color(0xFFBFD7FF),
            elevation: 3,
          ),
          child: Image.asset(imagen, width: 28),
        ),
        const SizedBox(height: 5),
        Text(
          texto,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}