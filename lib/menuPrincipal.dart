import 'package:flutter/material.dart';
import 'package:miki/inventario.dart';
import 'profile.dart'; 
import 'package:miki/statistics.dart';


class menuPrincipal extends StatelessWidget {
  const menuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    bottomNavigationBar: BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 0,
      height: 50, 
      color: const Color(0xFF1B4CE0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const menuPrincipal()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.bar_chart, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Statistics()),
                );
              },
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.layers, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
    ),
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
                      AccesoRapidoWidget(imagen: 'assets/venta.png', texto: 'Registrar\nVenta'),
                      AccesoRapidoWidget(imagen: 'assets/gasto.png', texto: 'Registrar\nGastos'),
                      AccesoRapidoWidget(imagen: 'assets/inventario.png', texto: 'Inventario'),
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

// Totales
class TotalesWidget extends StatelessWidget {
  final String titulo;
  final String monto;

  const TotalesWidget({super.key, required this.titulo, required this.monto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(titulo, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 5),
        Text(
          monto,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: monto.contains('-') ? Colors.red : Colors.blue,
          ),
        ),
      ],
    );
  }
}

// Producto
class ProductoWidget extends StatelessWidget {
  final String nombre;
  final String hora;
  final String mes;
  final String precio;
  final String imagen;

  const ProductoWidget({
    super.key,
    required this.nombre,
    required this.hora,
    required this.mes,
    required this.precio,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imagen, width: 40, height: 40, fit: BoxFit.cover),
      title: Text(nombre),
      subtitle: Text(hora, style: const TextStyle(color: Colors.blue)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(mes),
          Text(precio, style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}

class AccesoRapidoWidget extends StatelessWidget {
  final String imagen;
  final String texto;

  const AccesoRapidoWidget({super.key, required this.imagen, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            backgroundColor: const Color(0xFFBFD7FF),
            elevation: 3,
          ),
          child: Image.asset(imagen, width: 28),
        ),
        const SizedBox(height: 5),
        Text(
          texto,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
