import 'package:flutter/material.dart';
import 'package:miki/models/views/stock_productos.dart';
import 'package:miki/service/super_service.dart';

import '../products/actualizar.dart';
import '../products/registrarP.dart';
import '../products/seleccionarP.dart';

class GestionInventarioPage extends StatefulWidget {
  const GestionInventarioPage({super.key});

  @override
  State<GestionInventarioPage> createState() => _GestionInventarioPageState();
}

class _GestionInventarioPageState extends State<GestionInventarioPage> {
  final AppService _appService = AppService();
  List<StockProducto> _productos = [];

  @override
  void initState() {
    super.initState();
    _cargarProductos();
  }

  Future<void> _cargarProductos() async {
    final productos = await _appService.obtenerStockActual();
    setState(() {
      _productos = productos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestión de Inventario"),
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total de Referencias'),
                      Text('${_productos.length}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Costo Total'),
                      Text('L${_productos.fold<double>(0, (sum, p) => sum + p.costo)}'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ..._productos.map((producto) {
              return Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDEFFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(producto.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text("Precio: L${producto.precio.toStringAsFixed(2)}"),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            // Acción eliminar producto
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Stock Disponible"),
                        Text('${producto.stock}'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductSelectionScreen()));
                          },
                          child: const Text("Actualizar Producto"),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const CrearProductoScreen()));
                          },
                          child: const Text("Editar Producto"),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
