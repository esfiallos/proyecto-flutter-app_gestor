import 'package:flutter/material.dart';

class NuevoGasto extends StatefulWidget {
  const NuevoGasto({super.key});

  @override
  _NuevoGastoState createState() => _NuevoGastoState();
}

class _NuevoGastoState extends State<NuevoGasto> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController valorController = TextEditingController();
  final TextEditingController conceptoController = TextEditingController();

  String? categoriaSeleccionada;
  String? subcategoriaSeleccionada;
  String metodoPago = 'Efectivo';

  final List<String> categorias = ['Entretenimiento', 'Alimento', 'Servicios'];
  final List<String> subcategorias = ['Cine', 'Restaurante', 'Agua', 'Luz'];
  final List<String> metodosPago = ['Efectivo', 'Tarjeta', 'Transferencia'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Gasto'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {}, // Acción de cerrar
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nombre del Gasto",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: nombreController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),

            Text(
              "Categoría del Gasto",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
              onChanged: (val) =>
                  setState(() => subcategoriaSeleccionada = val),
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

            Text(
              "Método de Pago",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          GastoConfirmado(valor: valorController.text),
                    ),
                  );
                },
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
  final String valor;
  const GastoConfirmado({super.key, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[600],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_outline, color: Colors.white, size: 100),
              SizedBox(height: 16),
              Text(
                "!Creaste un Gasto!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                "Se registró en un balance por el monto de L $valor",
                style: TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: Text("Ver Balance"),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: Text("Ver Comportamiento"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
