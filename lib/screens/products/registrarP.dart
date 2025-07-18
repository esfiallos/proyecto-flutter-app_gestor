import 'package:flutter/material.dart';


class RegistrarProductoPage extends StatefulWidget {
  const RegistrarProductoPage({super.key});

  @override
  State<RegistrarProductoPage> createState() => _RegistrarProductoPageState();
}

class _RegistrarProductoPageState extends State<RegistrarProductoPage> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController costoController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController fechaVencimientoController = TextEditingController();

  bool mostrarFecha = false;

  String? categoriaSeleccionada;
  final List<String> categorias = [
    'Selecciona una opción',
    'Bebidas',
    'Snacks',
    'Lácteos',
    'Abarrotes',
    'Limpieza',
  ];

  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        fechaVencimientoController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _crearProducto() {
    if (nombreController.text.isEmpty ||
        cantidadController.text.isEmpty ||
        precioController.text.isEmpty ||
        costoController.text.isEmpty ||
        categoriaSeleccionada == null ||
        categoriaSeleccionada == 'Selecciona una opción') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Producto creado exitosamente')),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    nombreController.dispose();
    cantidadController.dispose();
    precioController.dispose();
    costoController.dispose();
    descripcionController.dispose();
    fechaVencimientoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Producto'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.upload_file, size: 70, color: Colors.black54),
            const SizedBox(height: 16),
            _campoTexto(nombreController, 'Nombre del Producto'),
            const SizedBox(height: 12),
            _campoTexto(cantidadController, 'Cantidad Disponible', tipo: TextInputType.number),
            const SizedBox(height: 12),
            _campoTexto(precioController, 'Precio', tipo: TextInputType.number),
            const SizedBox(height: 12),
            _campoTexto(costoController, 'Costo', tipo: TextInputType.number),
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: categoriaSeleccionada,
              hint: const Text('Selecciona una opción'),
              decoration: _inputDecoration(),
              items: categorias.map((String categoria) {
                return DropdownMenuItem<String>(
                  value: categoria,
                  child: Text(categoria),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  categoriaSeleccionada = value;
                });
              },
            ),
            const SizedBox(height: 12),
            _campoTexto(descripcionController, 'Descripción'),
            const SizedBox(height: 12),

            
            Row(
              children: [
                Checkbox(
                  value: mostrarFecha,
                  onChanged: (value) {
                    setState(() {
                      mostrarFecha = value!;
                      if (!mostrarFecha) {
                        fechaVencimientoController.clear();
                      }
                    });
                  },
                ),
                const Text('¿Agregar fecha de vencimiento?'),
              ],
            ),

            
            if (mostrarFecha)
              TextField(
                controller: fechaVencimientoController,
                readOnly: true,
                onTap: () => _seleccionarFecha(context),
                decoration: _inputDecoration().copyWith(
                  labelText: 'Fecha de vencimiento',
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
              ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _crearProducto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Crear Producto'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }

  Widget _campoTexto(TextEditingController controller, String label,
      {TextInputType tipo = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: tipo,
      decoration: _inputDecoration().copyWith(labelText: label),
    );
  }
}