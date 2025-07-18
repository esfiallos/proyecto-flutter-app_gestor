import 'package:flutter/material.dart';
import 'package:miki/widgets/MenuBar.dart';

class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    const String totalBalance = 'L.2,187.00';
    const String ingresosAmount = 'L.4,000.00';
    const String egresosAmount = 'L.1,187.00';

    final List<Map<String, dynamic>> ingresosSummary = [
      {'label': 'Total De Ventas', 'value': 'L.4,000.00', 'color': Colors.black87},
      {'label': 'Efectivo', 'value': 'L.1,000.00', 'color': Colors.blue},
      {'label': 'Otros Metodos De Pago', 'value': 'L.3,000.00', 'color': Colors.blue},
    ];

    final List<Map<String, dynamic>> egresosSummary = [
      {'label': 'Efectivo', 'value': '-L.594,00', 'color': Colors.red},
      {'label': 'Otros Medios', 'value': '-L.593,00', 'color': Colors.red},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Balance',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              totalBalance,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              'Balance',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBalanceCard(
                  context,
                  icon: Icons.arrow_outward,
                  label: 'Ingresos',
                  amount: ingresosAmount,
                  iconColor: Colors.blue,
                  amountColor: Colors.blue,
                ),
                _buildBalanceCard(
                  context,
                  icon: Icons.arrow_downward,
                  label: 'Egresos',
                  amount: egresosAmount,
                  iconColor: Colors.red,
                  amountColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Resumen De Ingresos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Divider(height: 25, thickness: 1, color: Colors.grey),
                  ...ingresosSummary.map((item) =>
                      _buildSummaryRow(item['label']!, item['value']!, item['color']!)),
                  const SizedBox(height: 20),
                  const Text(
                    'Resumen De Egresos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Divider(height: 25, thickness: 1, color: Colors.grey),
                  ...egresosSummary.map((item) =>
                      _buildSummaryRow(item['label']!, item['value']!, item['color']!)),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),

      //  Aquí se agrega el menú inferior
      bottomNavigationBar: const MenuBarraAbajo(currentIndex: 2),
    );
  }

  Widget _buildBalanceCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String amount,
    required Color iconColor,
    required Color amountColor,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 40,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 30, color: iconColor),
            const SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            const SizedBox(height: 5),
            Text(
              amount,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: amountColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
