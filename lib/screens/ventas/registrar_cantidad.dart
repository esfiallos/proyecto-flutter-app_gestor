import 'package:flutter/material.dart';

class ConfirmarCantidadesPage extends StatelessWidget {
  const ConfirmarCantidadesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmar Cantidades"),
        leading: const BackButton(),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Fecha
            TextFormField(
              decoration: InputDecoration(
                labelText: "Fecha",
                suffixIcon: const Icon(Icons.calendar_today_outlined),
              ),
              readOnly: true,
              onTap: () async {
                // Manejar la fecha seleccionada...
              },
            ),
            const SizedBox(height: 16),

            // Editar productos
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text("Editar Productos"),
            ),
            const SizedBox(height: 16),

            // Cliente
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Cliente"),
              items: const [
                DropdownMenuItem(value: "cliente1", child: Text("Cliente 1")),
                DropdownMenuItem(value: "cliente2", child: Text("Cliente 2")),
              ],
              onChanged: (val) {},
            ),
            const SizedBox(height: 16),

            // Métodos de pago
            const Text("Método de Pago", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                MetodoPagoButton(icon: Icons.money, label: "Efectivo"),
                MetodoPagoButton(icon: Icons.credit_card, label: "Tarjeta"),
                MetodoPagoButton(icon: Icons.account_balance, label: "Transferencia"),
              ],
            ),
            const SizedBox(height: 16),

            // Concepto
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Concepto",
                hintText: "Dale un nombre a tu venta",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(12),
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("6"), // Cantidad de productos o ítems
                Text("Crear Venta   L 60"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MetodoPagoButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const MetodoPagoButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, size: 28, color: Colors.black87),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
