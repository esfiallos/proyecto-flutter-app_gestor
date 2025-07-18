import 'package:flutter/material.dart';
import 'package:miki/widgets/AccesoRapidoWidget.dart';
import 'package:miki/widgets/MenuBar.dart';
import 'package:miki/widgets/ProductWidget.dart';
import 'package:miki/widgets/TotalesWidget.dart';


class menuPrincipal extends StatelessWidget {
  const menuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    bottomNavigationBar: const MenuBarraAbajo(currentIndex: 0,),
    body: SafeArea(
      child: Column(
        children: [
          // 🟦 Header azul fijo
          Container(
            width: double.infinity,
            color: const Color(0xFF1B4CE0),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Hola, Bienvenido!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 5),
                Text('Danerys Flores', style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
          ),

          // ⬇️ Contenido que se puede scrollear
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sección Totales
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      TotalesWidget(titulo: 'Total Balance', monto: 'Lps 7,783.00'),
                      TotalesWidget(titulo: 'Total Expense', monto: '-Lps1.187.40'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Filtro por Mes, Semana, Día
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: () {}, child: const Text("Dia")),
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
                  ),
                  const SizedBox(height: 20),

                  // Productos
                  ProductoWidget(nombre: 'Producto 1', hora: '18:27 - Abril 30', mes: 'Abril', precio: 'Lps 200.00', imagen: 'assets/producto1.png'),
                  ProductoWidget(nombre: 'Producto 2', hora: '17:00 - Marzo 24', mes: 'Marzo', precio: 'Lps 150.00', imagen: 'assets/producto2.png'),
                  ProductoWidget(nombre: 'Producto 3', hora: '8:30 - Mayo 15', mes: 'Mayo', precio: 'Lps 100.00', imagen: 'assets/producto3.png'),

                  const SizedBox(height: 10),
                  const Text('Accesos Rapidos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      AccesoRapidoWidget(imagen: 'assets/venta.png', 
                      texto: 'Registrar\nVenta',
                      ruta: '/',),
                      AccesoRapidoWidget(imagen: 'assets/gasto.png', 
                      texto: 'Registrar\nGastos',
                      ruta: '/nuevoGasto',),
                      AccesoRapidoWidget(imagen: 'assets/inventario.png', 
                      texto: 'Inventario',
                      ruta: '/inventario',),
                    ],
                  ),
                  const SizedBox(height: 20),
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


