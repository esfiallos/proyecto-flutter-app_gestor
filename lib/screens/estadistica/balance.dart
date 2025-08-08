import 'package:flutter/material.dart';
import 'package:miki/service/super_service.dart';
import 'package:miki/widgets/MenuBar.dart';
import 'package:miki/models/views/balance_general.dart';
import 'package:miki/models/views/egreso_metodo_pago.dart';
import 'package:miki/models/views/ventas_metodo_pago.dart';

class Balance extends StatefulWidget {
  const Balance({super.key});

  @override
  State<Balance> createState() => _BalancePageState();
}

class _BalancePageState extends State<Balance> {
  final AppService appService = AppService();

  BalanceGeneral? balanceGeneral;
  List<VentasPorMetodoPago> ventasPorMetodo = [];
  List<EgresosPorMetodoPago> egresosPorMetodo = [];

  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  Future<void> cargarDatos() async {
    try {
      // 🔹 Activa esta línea para insertar datos de prueba si no tienes ventas/gastos aún:
      // await appService.insertarDatosPrueba();

      final balance = await _obtenerBalanceSeguro();
      final ventas = await _obtenerVentasSeguras();
      final egresos = await _obtenerEgresosSeguros();

      setState(() {
        balanceGeneral = balance;
        ventasPorMetodo = ventas;
        egresosPorMetodo = egresos;
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Error cargando datos del balance: $e");
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  /// 🔹 Envuelve la llamada al AppService para que nunca devuelva null o falle
  Future<BalanceGeneral> _obtenerBalanceSeguro() async {
    try {
      final balance = await appService.obtenerBalance();
      return balance ??
          BalanceGeneral(
              totalIngresos: 0, totalEgresos: 0, balance: 0);
    } catch (_) {
      return BalanceGeneral(
          totalIngresos: 0, totalEgresos: 0, balance: 0);
    }
  }

  Future<List<VentasPorMetodoPago>> _obtenerVentasSeguras() async {
    try {
      return await appService.obtenerVentasPorMetodoPago();
    } catch (_) {
      return [];
    }
  }

  Future<List<EgresosPorMetodoPago>> _obtenerEgresosSeguros() async {
    try {
      return await appService.obtenerEgresosPorMetodoPago();
    } catch (_) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (hasError) {
      return Scaffold(
        appBar: AppBar(title: const Text('Balance')),
        body: const Center(
          child: Text('Ocurrió un error cargando los datos.'),
        ),
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
              'L.${(balanceGeneral?.balance ?? 0).toStringAsFixed(2)}',
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
                  amount: 'L.${(balanceGeneral?.totalIngresos ?? 0).toStringAsFixed(2)}',
                  iconColor: Colors.blue,
                  amountColor: Colors.blue,
                ),
                _buildBalanceCard(
                  icon: Icons.arrow_downward,
                  label: 'Egresos',
                  amount: 'L.${(balanceGeneral?.totalEgresos ?? 0).toStringAsFixed(2)}',
                  iconColor: Colors.red,
                  amountColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildResumenMetodoPago(
              titulo: 'Resumen De Ingresos Por Método',
              vacioMensaje: 'No hay datos de ingresos.',
              lista: ventasPorMetodo.map(
                (v) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(v.metodoPago),
                  subtitle: Text('Ventas: ${v.cantidadVentas}'),
                  trailing: Text('L.${v.total.toStringAsFixed(2)}'),
                ),
              ).toList(),
            ),
            const SizedBox(height: 30),
            _buildResumenMetodoPago(
              titulo: 'Resumen De Egresos Por Método',
              vacioMensaje: 'No hay datos de egresos.',
              lista: egresosPorMetodo.map(
                (e) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(e.metodoPago),
                  subtitle: Text('Gastos: ${e.cantidadGastos}'),
                  trailing: Text('-L.${e.total.toStringAsFixed(2)}'),
                ),
              ).toList(),
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

  Widget _buildResumenMetodoPago({
    required String titulo,
    required String vacioMensaje,
    required List<Widget> lista,
  }) {
    return Container(
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
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Divider(height: 25, thickness: 1, color: Colors.grey),
          if (lista.isEmpty)
            Text(vacioMensaje)
          else
            ...lista,
        ],
      ),
    );
  }
}
