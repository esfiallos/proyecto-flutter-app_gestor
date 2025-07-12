import 'package:flutter/material.dart';


class Product {
  final String nombre;
  int cantidad;
  String precio;

  Product({required this.nombre, this.cantidad = 0, this.precio = '10'});
}


class ConfirmarCantidadesPage extends StatefulWidget {
  const ConfirmarCantidadesPage({super.key});

  @override
  State<ConfirmarCantidadesPage> createState() => _ConfirmarCantidadesPageState();
}

class _ConfirmarCantidadesPageState extends State<ConfirmarCantidadesPage> {
  List<Product> productos = List.generate(
    4,
    (_) => Product(nombre: 'Nombre del Producto', precio: '10'),
  );

  void aumentar(int index) {
    setState(() {
      productos[index].cantidad++;
    });
  }

  void disminuir(int index) {
    setState(() {
      if (productos[index].cantidad > 0) productos[index].cantidad--;
    });
  }

  void eliminar(int index) {
    setState(() {
      productos.removeAt(index);
    });
  }

  int totalCantidad() {
    return productos.fold(0, (sum, item) => sum + item.cantidad);
  }

  double totalPrecio() {
    double total = 0.0;
    for (var item in productos) {
      if (item.precio.isNotEmpty) {
        final precio = double.tryParse(item.precio.replaceAll(',', '.')) ?? 0.0;
        total += precio * item.cantidad;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Confirmar Cantidades"),
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: productos.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final p = productos[index];
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      p.nombre,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => eliminar(index),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                
                Row(
                  children: [
                    Text("Cantidad:", style: TextStyle(fontSize: 14)),
                    SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.blue),
                            onPressed: () => disminuir(index),
                            splashRadius: 20,
                          ),
                          Text('${p.cantidad}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.blue),
                            onPressed: () => aumentar(index),
                            splashRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text("Precio:", style: TextStyle(fontSize: 14)),
                    SizedBox(width: 8),
                    SizedBox(
                      width: 90,
                      height: 40,
                      child: TextField(
                        controller: TextEditingController(text: p.precio),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixText: 'L',
                          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          isDense: true,
                        ),
                        onChanged: (value) => setState(() {
                          p.precio = value;
                        }),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            // Acción al confirmar
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              Row(
                children: [
                  Icon(Icons.shopping_cart, size: 20, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    '${totalCantidad()} productos',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              
              Text(
                "Confirmar",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              
              Text(
                'L${totalPrecio().toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}