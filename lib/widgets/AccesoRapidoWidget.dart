import 'package:flutter/material.dart';

class AccesoRapidoWidget extends StatelessWidget {
  final String imagen;
  final String texto;
  final String? ruta;
  final VoidCallback? onPressed;

  const AccesoRapidoWidget({
    super.key,
    required this.imagen,
    required this.texto,
    this.ruta,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {
        if (ruta != null) {
          Navigator.pushNamed(context, ruta!);
        }
      },
      child: Column(
        children: [
          Image.asset(imagen, width: 50, height: 50),
          const SizedBox(height: 6),
          Text(texto, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
