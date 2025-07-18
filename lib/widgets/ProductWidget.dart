// Producto
import 'package:flutter/material.dart';

class ProductoWidget extends StatelessWidget {
  final String nombre;
  final String hora;
  final String mes;
  final String precio;
  final String imagen;

  const ProductoWidget({
    super.key,
    required this.nombre,
    required this.hora,
    required this.mes,
    required this.precio,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imagen, width: 40, height: 40, fit: BoxFit.cover),
      title: Text(nombre),
      subtitle: Text(hora, style: const TextStyle(color: Colors.blue)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(mes),
          Text(precio, style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}