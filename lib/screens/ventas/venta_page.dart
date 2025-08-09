import 'package:flutter/material.dart';
import 'package:miki/models/productos.dart';
import 'package:miki/models/detalle_venta.dart';
import 'package:miki/models/venta.dart';
import 'package:miki/screens/ventas/comporbante_venta.dart';
import 'package:miki/service/super_service.dart';

class VentaProductosPage extends StatefulWidget {
  const VentaProductosPage({super.key});

  @override
  State<VentaProductosPage> createState() => _VentaProductosPageState();
}

class _VentaProductosPageState extends State<VentaProductosPage> {
  List<Producto> _productos = [];
  Map<int, int> _cantidades = {};
  bool _cargando = true;

  String _metodoPago = 'Efectivo';
  final List<String> _metodosPago = ['Efectivo', 'Tarjeta', 'Transferencia'];

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

    final venta = Venta(
      tipoVenta: 'productos',
      fecha: DateTime.now().toIso8601String(),
      concepto: 'Venta de productos',
      metodoPago: _metodoPago,
    );

    final detalles = _cantidades.entries.map((e) {
      return DetalleVenta(
        idVenta: 0,
        idProducto: e.key,
        cantidad: e.value,
      );
    }).toList();

    try {
      await AppService().registrarVentaCompleta(venta, detalles);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ComprobanteVentaPage(
            venta: venta,
            detalles: detalles,
            productos: _productos, // 🔹 Enviamos la lista completa
          ),
        ),
      );
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
          ),

          const Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Método de Pago',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _metodosPago.map((m) {
                    return ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            m == 'Efectivo'
                                ? Icons.money
                                : m == 'Tarjeta'
                                    ? Icons.credit_card
                                    : Icons.account_balance,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(m),
                        ],
                      ),
                      selected: _metodoPago == m,
                      onSelected: (_) => setState(() => _metodoPago = m),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _guardarVenta,
                child: const Text('Guardar Venta'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B4CE0),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
