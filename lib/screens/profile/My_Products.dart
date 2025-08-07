import 'package:flutter/material.dart';
import 'package:miki/models/productos.dart';
import 'package:miki/service/super_service.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _PantallaProductosState();
}

class _PantallaProductosState extends State<MyProducts> {
  final AppService _appService = AppService();
  List<Producto> _productos = [];
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    cargarProductos();
  }

  Future<void> cargarProductos() async {
    final productos = await _appService.obtenerProductos();
    setState(() {
      _productos = productos;
      _cargando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Productos")),
      body: _cargando
          ? const Center(child: CircularProgressIndicator())
          : _productos.isEmpty
              ? const Center(child: Text("No hay productos"))
              : ListView.builder(
                  itemCount: _productos.length,
                  itemBuilder: (context, index) {
                    final producto = _productos[index];
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: _imagenProducto(producto),
                        title: Text(producto.nombre),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Código: ${producto.codigo}"),
                            Text("Precio: L. ${producto.precio}"),
                            Text("Stock: ${producto.stock}"),
                            if (producto.descripcion != null)
                              Text("Descripción: ${producto.descripcion}"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  Widget _imagenProducto(Producto producto) {
    if (producto.imagenSrc != null && producto.imagenSrc!.isNotEmpty) {
      return Image.network(
        producto.imagenSrc!,
        width: 50,
        height: 50,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.image_not_supported),
      );
    } else {
      return const Icon(Icons.shopping_bag, size: 50);
    }
  }
}
