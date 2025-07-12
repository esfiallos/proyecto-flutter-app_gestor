import 'package:flutter/material.dart';
import 'package:miki/product_card.dart';


class MyProducts extends StatelessWidget {
  const MyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Mis productos',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
          SizedBox(height: 15),
            CircleAvatar(
              radius: 40, 
              backgroundImage: NetworkImage(
                ' ', 
              ),
              backgroundColor: const Color.fromARGB(255, 19, 0, 0), 
            ),
            SizedBox(height: 5),
            
            Text(
                'Danery Flores',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ), 
              SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on, 
                  color: Colors.blueGrey[800],
                  size: 24, 
                ),
                SizedBox(width: 8), 
                Text(
                'Tegucigalpa',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ]
            ),

            SizedBox(height: 5), 

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone, 
                  color: Colors.blueGrey[800],
                  size: 24, 
                ),
                SizedBox(width: 8), 
                Icon(
                Icons.camera_alt, 
                color: Colors.blueGrey[800],
                size: 24, 
              ),
              SizedBox(width: 8), 
              Icon(
                Icons.email, 
                color: Colors.blueGrey[800],
                size: 24, 
              ),
              ]
            ),
            SizedBox(height: 10), 

            Text('Productos del vendedor',
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              ),
            ),



            const ProductCard(
              imageUrl: 'assets/producto1.png',
              productName: 'Tenis Deportivos',
              productDescription: 'Comodos, duraderos, flexibles.',
              priceText: 'L.1200.00',
              availableText: 'Uds. 3',
            ),

            const ProductCard(
              imageUrl: 'assets/producto2.png',
              productName: 'Gorra LA',
              productDescription: 'Color azul y letras blancas.',
              priceText: 'L.700.00',
              availableText: 'Uds. 6',
            ),

            const ProductCard(
              imageUrl: 'assets/producto3.png',
              productName: 'Camisa Polo',
              productDescription: 'Disponible en azul y blanco, tela de algodon.',
              priceText: 'L.500.00',
              availableText: 'Uds. 10',
            ),
          ]
        ),
      )
    );
  }
}