import 'package:flutter/material.dart';

class TotalesWidget extends StatelessWidget {
  final String titulo;
  final String monto;

  const TotalesWidget({super.key, required this.titulo, required this.monto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(titulo, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 5),
        Text(
          monto,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: monto.contains('-') ? Colors.red : Colors.blue,
          ),
        ),
      ],
    );
  }
}
