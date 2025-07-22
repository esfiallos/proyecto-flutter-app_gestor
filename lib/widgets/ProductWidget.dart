import 'package:flutter/material.dart';

class ProductoWidget extends StatelessWidget {
  final String nombre;
  final String precio;
  final String? imagen;

  const ProductoWidget({
    super.key,
    required this.nombre,
    required this.precio,
    this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: (imagen != null && imagen!.isNotEmpty)
          ? Image.asset(imagen!, width: 40, height: 40, fit: BoxFit.cover)
          : Container(
              width: 40,
              height: 40,
              color: Colors.grey.shade300,
              child: const Icon(Icons.image_not_supported, color: Colors.grey),
            ),
      title: Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: Text(precio, style: const TextStyle(color: Colors.blue)),
    );
  }
}