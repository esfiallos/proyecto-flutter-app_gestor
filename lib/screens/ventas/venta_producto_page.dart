import 'package:flutter/material.dart';

class VentaProductoPage extends StatelessWidget {
  const VentaProductoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venta de Productos'),
        backgroundColor: const Color(0xFF1B4CE0),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Aquí puedes seleccionar productos del inventario para vender.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
