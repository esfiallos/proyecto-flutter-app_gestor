import 'package:flutter/material.dart';

class VentaLibrePage extends StatelessWidget {
  const VentaLibrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venta Libre'),
        backgroundColor: const Color(0xFF1B4CE0),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Aquí puedes registrar un ingreso libre, sin productos del inventario.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
