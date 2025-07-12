import 'package:flutter/material.dart';

import 'editarP.dart';
import 'registrarP.dart';

class InventarioPage extends StatelessWidget {
  const InventarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Inventario'),
        centerTitle: true,
      ),
      body: Column(
        children: [
        
        Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
        onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegistrarProductoPage()),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: const Text('Registrar Producto'),
  ),
),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total de Referencias', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('3'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Costo Total', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('L100'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                  
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        SizedBox(width: 8),
                        Chip(label: Text('Todas')),
                        SizedBox(width: 8),
                        Chip(label: Text('Bebidas')),
                        SizedBox(width: 8),
                        Chip(label: Text('Snacks')),
                        SizedBox(width: 8),
                        Chip(label: Text('Lácteos')),
                        SizedBox(width: 8),
                        Chip(label: Text('Abarrotes')),
                        SizedBox(width: 8),
                        Chip(label: Text('Limpieza')),
                        SizedBox(width: 8),
                        Chip(label: Text('Otros')),
                        SizedBox(width: 8),
                        Chip(label: Text('Congelados')),
                        SizedBox(width: 8),
                        Chip(label: Text('Panadería')),
                        SizedBox(width: 8),
                        Chip(label: Text('Frutas')),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: 3,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      // Información del producto
                      Expanded(
                      child: GestureDetector(
                      onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GestionInventarioPage()),
                  );
                  },
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                  Text('Nombre Producto', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Stock: 10'),
                  Text('Precio: L25'),
                  ],
                  ),
                  ),
                  ),

                      // Icono de imagen
                      const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

     
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 2, 
        onTap: (index) {
       
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}