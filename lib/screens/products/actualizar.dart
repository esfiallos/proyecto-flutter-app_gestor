import 'package:flutter/material.dart';

import '../inventario/GestionInventarioPage.dart';
import '../inventario/inventario.dart';


class CrearProductoScreen extends StatefulWidget {
  const CrearProductoScreen({super.key});

  @override
  State<CrearProductoScreen> createState() => _CrearProductoScreenState();
}

class _CrearProductoScreenState extends State<CrearProductoScreen> {
  final _formKey = GlobalKey<FormState>();
  String? categoriaSeleccionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Crear Producto"),
      backgroundColor: Colors.blue[400],
      leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GestionInventarioPage()),
          );
        },
      ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Center(
                child: IconButton(
                  icon: const Icon(Icons.upload, size: 40),
                  onPressed: () {
                    
                  },
                ),
              ),
              const SizedBox(height: 20),

              
              _buildTextField("Nombre del Producto"),
              const SizedBox(height: 10),
              _buildTextField("Cantidad Disponible", inputType: TextInputType.number),
              const SizedBox(height: 10),
              _buildTextField("Precio", inputType: TextInputType.number),
              const SizedBox(height: 10),
              _buildTextField("Costo", inputType: TextInputType.number),
              const SizedBox(height: 10),

              
              DropdownButtonFormField<String>(
                value: categoriaSeleccionada,
                decoration: const InputDecoration(
                  labelText: "Categorías",
                  border: OutlineInputBorder(),
                ),
                hint: const Text("Selecciona una Opción"),
                items: const [
                  DropdownMenuItem(value: "Bebidas", child: Text("Bebidas")),
                  DropdownMenuItem(value: "Comidas", child: Text("Comidas")),
                  DropdownMenuItem(value: "Otros", child: Text("Otros")),
                ],
                onChanged: (value) {
                  setState(() {
                    categoriaSeleccionada = value;
                  });
                },
              ),
              const SizedBox(height: 10),

              
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Descripción",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              
            SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue[400],
      padding: const EdgeInsets.symmetric(vertical: 15),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InventarioPage()),
      );
    },
    child: const Text("Actualizar Producto"),
  ),
),
const SizedBox(height: 10),


              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    
                  },
                  child: const Text("Eliminar Producto"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {TextInputType inputType = TextInputType.text}) {
    return TextFormField(
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}