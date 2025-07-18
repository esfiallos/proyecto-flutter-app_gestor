import 'package:flutter/material.dart';

class CategoriaChips extends StatelessWidget {
  final List<String> categorias;
  final Function(String) onCategoriaSeleccionada;

  const CategoriaChips({
    super.key,
    required this.categorias,
    required this.onCategoriaSeleccionada,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categorias.map((categoria) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ActionChip(
              label: Text(categoria),
              onPressed: () => onCategoriaSeleccionada(categoria),
              backgroundColor: const Color(0xFFE3F2FD),
              labelStyle: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
      ),
    );
  }
}