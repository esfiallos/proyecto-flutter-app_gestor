import 'package:flutter/material.dart';
import 'package:miki/widgets/ProductWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:miki/models/views/stock_productos.dart';
import 'package:miki/service/super_service.dart';
import 'package:miki/widgets/AccesoRapidoWidget.dart';
import 'package:miki/widgets/MenuBar.dart';
import 'package:miki/widgets/TotalesWidget.dart';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  double totalBalance = 0.0;
  double totalGastos = 0.0;
  List<StockProducto> productos = [];
  String nombreUsuario = '';

  @override
  void initState() {
    super.initState();
    cargarDatos();
    cargarNombreUsuario();
  }

  Future<void> cargarDatos() async {
    final balance = await AppService().obtenerBalance();
    final gastos = await AppService().obtenerGastos();
    final listaProductos = await AppService().obtenerStockActual();

    double sumaGastos = 0.0;
    for (var gasto in gastos) {
      sumaGastos += gasto.cantidad ?? 0;
    }

    setState(() {
      totalBalance = balance.balance;
      totalGastos = sumaGastos;
      productos = listaProductos;
    });
  }

  Future<void> cargarNombreUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nombreUsuario = prefs.getString('nombre') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const MenuBarraAbajo(currentIndex: 0),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              color: const Color(0xFF1B4CE0),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hola, Bienvenido!',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 5),
                  Text(nombreUsuario,
                      style: const TextStyle(fontSize: 16, color: Colors.white)),
                ],
              ),
            ),

            // BODY
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TOTALES
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TotalesWidget(
                            titulo: 'Total Balance',
                            monto: 'Lps ${totalBalance.toStringAsFixed(2)}'),
                        TotalesWidget(
                            titulo: 'Total Expense',
                            monto: '-Lps ${totalGastos.toStringAsFixed(2)}'),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // FILTRO
                    filtroMesSemanaDia(),

                    // PRODUCTOS
                    ...productos.map((p) => ProductoWidget(producto: p)),


                    const SizedBox(height: 10),
                    const Text('Accesos Rápidos',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    accesosRapidos(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget filtroMesSemanaDia() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: () {}, child: const Text("Día")),
          TextButton(onPressed: () {}, child: const Text("Semana")),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1B4CE0),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: const Text("Mes", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget accesosRapidos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        AccesoRapidoWidget(imagen: 'assets/venta.png', texto: 'Registrar\nVenta', ruta: '/'),
        AccesoRapidoWidget(imagen: 'assets/gasto.png', texto: 'Registrar\nGastos', ruta: '/nuevoGasto'),
        AccesoRapidoWidget(imagen: 'assets/inventario.png', texto: 'Inventario', ruta: '/inventario'),
      ],
    );
  }
}