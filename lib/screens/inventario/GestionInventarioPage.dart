import 'package:flutter/material.dart';

import '../products/actualizar.dart';
import '../products/registrarP.dart';
import '../products/seleccionarP.dart';


class GestionInventarioPage extends StatefulWidget {
  const GestionInventarioPage({super.key});

  @override
  State<GestionInventarioPage> createState() => _GestionInventarioPageState();
}

class _GestionInventarioPageState extends State<GestionInventarioPage> {
  int stock = 1;

  void incrementarStock() {
    setState(() {
      stock++;
    });
  }

  void decrementarStock() {
    if (stock > 0) {
      setState(() {
        stock--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Producto"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegistrarProductoPage()),
              );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Registrar Productos'),
              ),

            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total de Referencias'),
                      Text('5'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Costo Total'),
                      Text('L100'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFEDEFFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nombre del Producto",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Precio: L10"),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Stock Disponible"),
                      Row(
                        children: [
                          IconButton(
                            onPressed: decrementarStock,
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          Text('$stock'),
                          IconButton(
                            onPressed: incrementarStock,
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  OutlinedButton(
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductSelectionScreen()),
                  );
                  },
                  child: const Text("Actualizar Producto"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CrearProductoScreen()),
                  );
                  },
                  child: const Text("Editar Producto"),
                  ),
                  ],
                ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}