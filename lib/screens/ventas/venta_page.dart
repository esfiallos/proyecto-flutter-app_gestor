import 'package:flutter/material.dart';
import 'package:miki/models/productos.dart';
import 'package:miki/models/detalle_venta.dart';
import 'package:miki/models/venta.dart';
import 'package:miki/service/super_service.dart';

class VentaProductosPage extends StatefulWidget {
  const VentaProductosPage({super.key});

  @override
  State<VentaProductosPage> createState() => _VentaProductosPageState();
}

class _VentaProductosPageState extends State<VentaProductosPage> {
  List<Producto> _productos = [];
  Map<int, int> _cantidades = {}; // key: idProducto, value: cantidad
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargarProductos();
  }

  Future<void> _cargarProductos() async {
    final productos = await AppService().obtenerProductos();
    setState(() {
      _productos = productos;
      _cargando = false;
    });
  }

  void _incrementarCantidad(int idProducto) {
    setState(() {
      _cantidades[idProducto] = (_cantidades[idProducto] ?? 0) + 1;
    });
  }

  void _decrementarCantidad(int idProducto) {
    if ((_cantidades[idProducto] ?? 0) > 0) {
      setState(() {
        _cantidades[idProducto] = _cantidades[idProducto]! - 1;
        if (_cantidades[idProducto] == 0) {
          _cantidades.remove(idProducto);
        }
      });
    }
  }

  Future<void> _guardarVenta() async {
    if (_cantidades.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona al menos un producto')),
      );
      return;
    }

    // Creamos la venta
    final venta = Venta(
      tipoVenta: 'productos',
      fecha: DateTime.now().toIso8601String(),
      concepto: 'Venta de productos',
      metodoPago: null, // Podrías agregar opción para elegir
    );

    // Creamos los detalles
    final detalles = _cantidades.entries.map((e) {
      return DetalleVenta(
        idVenta: 0, // se asigna al insertar
        idProducto: e.key,
        cantidad: e.value,
      );
    }).toList();

    try {
      await AppService().registrarVentaCompleta(venta, detalles);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Venta registrada correctamente')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar venta: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_cargando) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Venta de Productos'),
        backgroundColor: const Color(0xFF1B4CE0),
      ),
      body: ListView.builder(
        itemCount: _productos.length,
        itemBuilder: (context, index) {
          final producto = _productos[index];
          final cantidad = _cantidades[producto.id!] ?? 0;

          return ListTile(
            title: Text(producto.nombre),
            subtitle: Text('Precio: Lps ${producto.precio.toStringAsFixed(2)}'),
            trailing: SizedBox(
              width: 120,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => _decrementarCantidad(producto.id!),
                  ),
                  Text(cantidad.toString()),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () => _incrementarCantidad(producto.id!),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: _guardarVenta,
          child: const Text('Guardar Venta'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1B4CE0),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }
}
