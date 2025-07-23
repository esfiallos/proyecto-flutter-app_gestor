import 'package:flutter/material.dart';
import 'package:miki/service/super_service.dart';
import 'package:miki/widgets/MenuBar.dart';
import 'package:miki/models/views/balance_general.dart';
import 'package:miki/models/views/egreso_metodo_pago.dart';
import 'package:miki/models/views/ventas_metodo_pago.dart';

class Balance extends StatefulWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  State<Balance> createState() => _BalancePageState();
}

class _BalancePageState extends State<Balance> {
  final AppService appService = AppService();

  BalanceGeneral? balanceGeneral;
  List<VentasPorMetodoPago> ventasPorMetodo = [];
  List<EgresosPorMetodoPago> egresosPorMetodo = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  Future<void> cargarDatos() async {
    try {
      final balance = await appService.obtenerBalance();
      final ventas = await appService.obtenerVentasPorMetodoPago();
      final egresos = await appService.obtenerEgresosPorMetodoPago();

      setState(() {
        balanceGeneral = balance;
        ventasPorMetodo = ventas;
        egresosPorMetodo = egresos;
        isLoading = false;
      });
    } catch (e) {
      // Manejar error, mostrar mensaje o log
      setState(() {
        isLoading = false;
      });
      // Opcional: mostrar snackbar o diálogo
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Balance',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'L.${balanceGeneral?.balance.toStringAsFixed(2) ?? '0.00'}',
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
                  icon: Icons.arrow_outward,
                  label: 'Ingresos',
                  amount: 'L.${balanceGeneral?.totalIngresos.toStringAsFixed(2) ?? '0.00'}',
                  iconColor: Colors.blue,
                  amountColor: Colors.blue,
                ),
                _buildBalanceCard(
                  icon: Icons.arrow_downward,
                  label: 'Egresos',
                  amount: 'L.${balanceGeneral?.totalEgresos.toStringAsFixed(2) ?? '0.00'}',
                  iconColor: Colors.red,
                  amountColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
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
                    'Resumen De Ingresos Por Método',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Divider(height: 25, thickness: 1, color: Colors.grey),
                  if (ventasPorMetodo.isEmpty)
                    const Text('No hay datos de ingresos.'),
                  ...ventasPorMetodo.map(
                    (v) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(v.metodoPago),
                      subtitle: Text('Ventas: ${v.cantidadVentas}'),
                      trailing: Text('L.${v.total.toStringAsFixed(2)}'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Resumen De Egresos Por Método',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Divider(height: 25, thickness: 1, color: Colors.grey),
                  if (egresosPorMetodo.isEmpty)
                    const Text('No hay datos de egresos.'),
                  ...egresosPorMetodo.map(
                    (e) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(e.metodoPago),
                      subtitle: Text('Gastos: ${e.cantidadGastos}'),
                      trailing: Text('-L.${e.total.toStringAsFixed(2)}'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: const MenuBarraAbajo(currentIndex: 2),
    );
  }

  Widget _buildBalanceCard({
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
}