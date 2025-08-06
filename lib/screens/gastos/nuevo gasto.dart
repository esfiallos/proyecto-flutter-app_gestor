import 'package:flutter/material.dart';
import 'package:miki/models/gasto.dart';
import 'package:miki/screens/gastos/comprobante_gasto.dart';
import 'package:miki/service/super_service.dart';

class NuevoGasto extends StatefulWidget {
  const NuevoGasto({super.key});

  @override
  _NuevoGastoState createState() => _NuevoGastoState();
}

class _NuevoGastoState extends State<NuevoGasto> {
  final AppService _service = AppService();

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController valorController = TextEditingController();
  final TextEditingController conceptoController = TextEditingController();

  String? categoriaSeleccionada;
  String? subcategoriaSeleccionada;
  String metodoPago = 'Efectivo';

  final List<String> categorias = ['Entretenimiento', 'Alimento', 'Servicios'];
  final List<String> subcategorias = ['Cine', 'Restaurante', 'Agua', 'Luz'];
  final List<String> metodosPago = ['Efectivo', 'Tarjeta', 'Transferencia'];

  Future<void> _guardarGasto() async {
    final nombre = nombreController.text.trim();
    final concepto = conceptoController.text.trim();
    final valor = double.tryParse(valorController.text.trim());

    if (nombre.isEmpty || concepto.isEmpty || valor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos válidos')),
      );
      return;
    }

    final nuevoGasto = Gasto(
      valor: valor,
      metodoPago: metodoPago,
      concepto: concepto,
      // Si quieres usar subcategoría como idProducto, aquí debes convertirlo
      idProducto: null,
      cantidad: 1,
      fecha: DateTime.now().toIso8601String(),
    );

    try {
      await _service.registrarGasto(nuevoGasto);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
           builder: (_) => GastoConfirmado(
          nombre: nombre,
          concepto: concepto,
          metodoPago: metodoPago,
          valor: valor.toStringAsFixed(2),
          fecha: DateTime.now().toIso8601String().substring(0, 10),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar el gasto: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Gasto'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nombre del Gasto", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: nombreController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),

            Text("Categoría del Gasto", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              value: categoriaSeleccionada,
              items: categorias
                  .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                  .toList(),
              onChanged: (val) => setState(() => categoriaSeleccionada = val),
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),

            Text("Subcategoría", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              value: subcategoriaSeleccionada,
              items: subcategorias
                  .map((sub) => DropdownMenuItem(value: sub, child: Text(sub)))
                  .toList(),
              onChanged: (val) => setState(() => subcategoriaSeleccionada = val),
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),

            Text("Valor", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: 'L ',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            Text("Método de Pago", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: metodosPago.map((m) {
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
                      ),
                      SizedBox(width: 2),
                      Text(m),
                    ],
                  ),
                  selected: metodoPago == m,
                  onSelected: (_) => setState(() => metodoPago = m),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            Text("Concepto", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: conceptoController,
              maxLines: 3,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _guardarGasto,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text("Crear Gasto"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class GastoConfirmado extends StatelessWidget {
  final String nombre;
  final String concepto;
  final String metodoPago;
  final String valor;
  final String fecha;

  const GastoConfirmado({
    super.key,
    required this.nombre,
    required this.concepto,
    required this.metodoPago,
    required this.valor,
    required this.fecha,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 24),
            const Text(
              "Gasto Registrado",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Valor: L $valor",
              style: const TextStyle(color: Colors.white70, fontSize: 18),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/balance');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text("Ver Balance"),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ComprobanteGasto(
                            nombre: nombre,
                            concepto: concepto,
                            metodoPago: metodoPago,
                            valor: valor,
                            fecha: fecha,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text("Ver Comprobante"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
