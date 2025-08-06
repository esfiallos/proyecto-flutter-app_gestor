import 'package:flutter/material.dart';
import 'package:miki/models/views/stock_productos.dart';
import 'package:miki/screens/products/actualizar.dart';
import 'package:miki/service/super_service.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Botón Registrar Productos
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CrearProductoScreen(nombreProducto: ''),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Registrar Productos'),
                ),
              ),
            ),

            // 🔹 Resumen
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
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
     
  
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 Lista de productos
            Expanded(
              child: ListView.builder(
                itemCount: _productos.length,
                itemBuilder: (context, index) {
                  final producto = _productos[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDEFFF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🔹 Encabezado con nombre y eliminar
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      producto.nombre,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "Precio: L${producto.precio.toStringAsFixed(2)}",
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  // Acción eliminar producto (opcional)
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // 🔹 Stock
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Stock Disponible"),
                              Text('${producto.stock}'),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // 🔹 Botones
                          Row(
                            children: [
                             
                              const SizedBox(width: 10),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ActualizarProductosScreen(
                                          nombreProducto: producto.nombre,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text("Editar"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
