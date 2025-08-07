import 'package:flutter/material.dart';
import 'package:miki/models/views/stock_productos.dart';

class ProductoWidget extends StatelessWidget {
  final StockProducto producto;

  const ProductoWidget({
    super.key,
    required this.producto,
  });

  bool _esImagenValida(String? imagen) {
    return imagen != null && imagen.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _esImagenValida(producto.imagen)
          ? Image.asset(
              producto.imagen!,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _placeholder(),
            )
          : _placeholder(),
      title: Text(producto.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: Text('Lps ${producto.precio.toStringAsFixed(2)}', style: const TextStyle(color: Colors.blue)),
    );
  }

  Widget _placeholder() {
    return Container(
      width: 40,
      height: 40,
      color: Colors.grey.shade300,
      child: const Icon(Icons.image_not_supported, color: Colors.grey),
    );
  }
}
