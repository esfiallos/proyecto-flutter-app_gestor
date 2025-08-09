import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:miki/screens/estadistica/balance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:miki/models/detalle_venta.dart';
import 'package:miki/models/venta.dart';
import 'package:miki/models/productos.dart';
import 'package:share_plus/share_plus.dart';  // <-- Importa share_plus

class ComprobanteVentaPage extends StatefulWidget {
  final Venta venta;
  final List<DetalleVenta> detalles;
  final List<Producto> productos;

  const ComprobanteVentaPage({
    super.key,
    required this.venta,
    required this.detalles,
    required this.productos,
  });

  @override
  State<ComprobanteVentaPage> createState() => _ComprobanteVentaPageState();
}

class _ComprobanteVentaPageState extends State<ComprobanteVentaPage> {
  Future<void> _guardarEnPreferencias() async {
    final prefs = await SharedPreferences.getInstance();

    final data = {
      'venta': {
        'fecha': widget.venta.fecha,
        'metodoPago': widget.venta.metodoPago,
        'concepto': widget.venta.concepto,
      },
      'detalles': widget.detalles.map((d) => {
        'idProducto': d.idProducto,
        'cantidad': d.cantidad,
      }).toList(),
    };

    final jsonString = jsonEncode(data);
    await prefs.setString('ultima_venta', jsonString);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Comprobante guardado en SharedPreferences')),
    );

    // Construir texto para compartir
    final buffer = StringBuffer();
    buffer.writeln('Comprobante de Venta');
    buffer.writeln('Fecha: ${widget.venta.fecha}');
    buffer.writeln('Método de Pago: ${widget.venta.metodoPago}');
    buffer.writeln('Concepto: ${widget.venta.concepto}');
    buffer.writeln('');
    buffer.writeln('Productos:');
    for (var d in widget.detalles) {
      final prod = widget.productos.firstWhere((p) => p.id == d.idProducto);
      final total = prod.precio * d.cantidad;
      buffer.writeln(
        '${prod.nombre} (Código: ${prod.codigo}) - Cantidad: ${d.cantidad}, Precio: Lps ${prod.precio.toStringAsFixed(2)}, Total: Lps ${total.toStringAsFixed(2)}'
      );
    }
    final totalVenta = widget.detalles.fold<double>(0, (sum, d) {
      final prod = widget.productos.firstWhere((p) => p.id == d.idProducto);
      return sum + (prod.precio * d.cantidad);
    });
    buffer.writeln('');
    buffer.writeln('TOTAL: Lps ${totalVenta.toStringAsFixed(2)}');

    // Compartir texto usando share_plus
    await Share.share(buffer.toString(), subject: 'Comprobante de Venta');
  }

  @override
  Widget build(BuildContext context) {
    final productos = widget.productos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comprobante de Venta'),
        backgroundColor: const Color(0xFF1B4CE0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fecha: ${widget.venta.fecha}', style: const TextStyle(fontSize: 16)),
            Text('Método de Pago: ${widget.venta.metodoPago}', style: const TextStyle(fontSize: 16)),
            Text('Concepto: ${widget.venta.concepto}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            const Text('Productos:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Divider(),

            ...widget.detalles.map((d) {
              final prod = productos.firstWhere((p) => p.id == d.idProducto);
              final total = prod.precio * d.cantidad;

              return ListTile(
                title: Text('${prod.nombre} (Código: ${prod.codigo})'),
                subtitle: Text(
                  'Cantidad: ${d.cantidad} | Precio: Lps ${prod.precio.toStringAsFixed(2)} | Costo: Lps ${prod.costo?.toStringAsFixed(2) ?? "0"}',
                ),
                trailing: Text(
                  'Lps ${total.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),

            const Divider(),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'TOTAL: Lps ${widget.detalles.fold<double>(0, (sum, d) {
                  final prod = productos.firstWhere((p) => p.id == d.idProducto);
                  return sum + (prod.precio * d.cantidad);
                }).toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),

            const Spacer(),

            ElevatedButton.icon(
              icon: const Icon(Icons.share),
              label: const Text('Compartir/Guardar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: _guardarEnPreferencias,
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              icon: const Icon(Icons.bar_chart),
              label: const Text('Ir a Balance'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B4CE0),
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const Balance()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
