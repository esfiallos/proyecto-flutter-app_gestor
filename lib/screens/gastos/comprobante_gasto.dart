import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ComprobanteGasto extends StatelessWidget {
  final String nombre;
  final String concepto;
  final String metodoPago;
  final String valor;
  final String fecha;

  const ComprobanteGasto({
    super.key,
    required this.nombre,
    required this.concepto,
    required this.metodoPago,
    required this.valor,
    required this.fecha,
  });

  @override
  Widget build(BuildContext context) {
    final mensaje = '''
📄 COMPROBANTE DE GASTO

🧾 Nombre: $nombre
💬 Concepto: $concepto
💳 Método de Pago: $metodoPago
💰 Valor: L $valor
📅 Fecha: $fecha
''';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comprobante de Gasto'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "📄 COMPROBANTE",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text("🧾 Nombre: $nombre", style: TextStyle(fontSize: 16)),
                Text("💬 Concepto: $concepto", style: TextStyle(fontSize: 16)),
                Text("💳 Método de Pago: $metodoPago", style: TextStyle(fontSize: 16)),
                Text("💰 Valor: L $valor", style: TextStyle(fontSize: 16)),
                Text("📅 Fecha: $fecha", style: TextStyle(fontSize: 16)),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    Share.share(mensaje);
                  },
                  icon: const Icon(Icons.share),
                  label: const Text("Compartir por WhatsApp"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size.fromHeight(50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
