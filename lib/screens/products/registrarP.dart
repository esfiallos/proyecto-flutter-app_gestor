import 'package:flutter/material.dart';
import 'package:miki/models/productos.dart';
import 'package:miki/models/categoria.dart';
import 'package:miki/service/super_service.dart';

class CrearProductoScreen extends StatefulWidget {
  const CrearProductoScreen({super.key});

  @override
  State<CrearProductoScreen> createState() => _CrearProductoScreenState();
}

class _CrearProductoScreenState extends State<CrearProductoScreen> {
  final _formKey = GlobalKey<FormState>();
  final AppService _appService = AppService();

  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _costoController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  Categoria? _categoriaSeleccionada;
  List<Categoria> _categorias = [];

  @override
  void initState() {
    super.initState();
    _cargarCategorias();
  }

  Future<void> _cargarCategorias() async {
    final categorias = await _appService.obtenerCategorias();
    setState(() {
      _categorias = categorias;
    });
  }

  Future<void> _registrarProducto() async {
    if (!_formKey.currentState!.validate()) return;
    if (_categoriaSeleccionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona una categoría')),
      );
      return;
    }

    final producto = Producto(
      codigo: _codigoController.text.trim(),
      nombre: _nombreController.text.trim(),
      stock: int.tryParse(_stockController.text) ?? 0,
      precio: double.tryParse(_precioController.text) ?? 0.0,
      costo: double.tryParse(_costoController.text) ?? 0.0,
      descripcion: _descripcionController.text.trim(),
      imagenSrc: '',
      metodoPago: '',
      fechaVencimiento: '',
      idCategoria: _categoriaSeleccionada!.id!,
    );

    await _appService.registrarProducto(producto);
    if (mounted) Navigator.pop(context); // Volver al listado u otra pantalla
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Producto"),
        backgroundColor: Colors.blue[400],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _categorias.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Icon(Icons.add_box, size: 70, color: Colors.black54),
                    const SizedBox(height: 20),

                    TextFormField(
                      controller: _codigoController,
                      decoration: _inputDecoration("Código del Producto"),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Requerido' : null,
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _nombreController,
                      decoration: _inputDecoration("Nombre del Producto"),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Requerido' : null,
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _stockController,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration("Cantidad Disponible"),
                      validator: (value) => int.tryParse(value ?? '') == null
                          ? 'Número inválido'
                          : null,
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _precioController,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration("Precio"),
                      validator: (value) => double.tryParse(value ?? '') == null
                          ? 'Número inválido'
                          : null,
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _costoController,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration("Costo"),
                      validator: (value) => double.tryParse(value ?? '') == null
                          ? 'Número inválido'
                          : null,
                    ),
                    const SizedBox(height: 10),

                    DropdownButtonFormField<Categoria>(
                      value: _categoriaSeleccionada,
                      decoration: _inputDecoration("Categoría"),
                      items: _categorias.map((cat) {
                        return DropdownMenuItem(
                          value: cat,
                          child: Text(cat.nombre),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _categoriaSeleccionada = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _descripcionController,
                      maxLines: 3,
                      decoration: _inputDecoration("Descripción"),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _registrarProducto,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text("Registrar Producto"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
