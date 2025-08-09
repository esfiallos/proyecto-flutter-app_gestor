import 'package:flutter/material.dart';
import 'package:miki/screens/ventas/venta_producto_page.dart';
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
      sumaGastos += gasto.valor ?? 0;
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

  void _mostrarModalNuevaVenta() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return NuevaVentaModal(
          onVentaProductos: () {
            Navigator.of(dialogContext).pop();
            Navigator.pushNamed(context, '/venta-productos');
          },
          onVentaLibre: () {
            Navigator.of(dialogContext).pop();
            Navigator.pushNamed(context, '/venta-libre');
          },
        );
      },
    );
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TOTALES
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TotalesWidget(
                            titulo: 'Balance',
                            monto: 'Lps ${totalBalance.toStringAsFixed(2)}'),
                        TotalesWidget(
                            titulo: 'Total Gastos',
                            monto: '-Lps ${totalGastos.toStringAsFixed(2)}'),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // PRODUCTOS
                    ...productos.map((p) => ProductoWidget(producto: p)),

                    const SizedBox(height: 10),
                    const Text('Accesos Rápidos',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AccesoRapidoWidget(
                          imagen: 'assets/venta.png',
                          texto: 'Registrar\nVenta',
                          onPressed: _mostrarModalNuevaVenta,
                        ),
                        const AccesoRapidoWidget(
                          imagen: 'assets/gasto.png',
                          texto: 'Registrar\nGastos',
                          ruta: '/nuevoGasto',
                        ),
                        AccesoRapidoWidget(
                          imagen: 'assets/inventario.png',
                          texto: 'Inventario',
                          onPressed: () async {
                            await Navigator.pushNamed(context, '/inventario');
                            await cargarDatos();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
