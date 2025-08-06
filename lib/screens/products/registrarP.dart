import 'package:flutter/material.dart';
import 'package:miki/models/productos.dart';
import 'package:miki/models/categoria.dart';
import 'package:miki/service/super_service.dart';

class CrearProductoScreen extends StatefulWidget {
  final String nombreProducto;

  const CrearProductoScreen({super.key, required this.nombreProducto});

  @override
  State<CrearProductoScreen> createState() => _CrearProductoScreenState();
}

class _CrearProductoScreenState extends State<CrearProductoScreen> {
  final _formKey = GlobalKey<FormState>();
  final AppService _appService = AppService();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _costoController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  String? _codigoProducto;
  Categoria? _categoriaSeleccionada;
  List<Categoria> _categorias = [];

  @override
  void initState() {
    super.initState();
    _cargarCategoriasYProducto();
  }

  Future<void> _cargarCategoriasYProducto() async {
    final categorias = await _appService.obtenerCategorias();
    final productos = await _appService.buscarProductosPorNombre(widget.nombreProducto);

    if (productos.isNotEmpty) {
      final producto = productos.first;

      setState(() {
        _codigoProducto = producto.codigo;
        _nombreController.text = producto.nombre;
        _stockController.text = producto.stock.toString();
        _precioController.text = producto.precio.toString();
        _costoController.text = producto.costo.toString();
        _descripcionController.text = producto.descripcion ?? '';
        _categorias = categorias;
        _categoriaSeleccionada = categorias.firstWhere(
          (cat) => cat.id == producto.idCategoria,
          orElse: () => Categoria(id: null, nombre: "Sin categoría"),
        );
      });
    }
  }

  Future<void> _actualizarProducto() async {
    if (_codigoProducto == null || _categoriaSeleccionada == null) return;

    final producto = Producto(
      codigo: _codigoProducto!,
      nombre: _nombreController.text,
      stock: int.tryParse(_stockController.text) ?? 0,
      precio: double.tryParse(_precioController.text) ?? 0.0,
      costo: double.tryParse(_costoController.text) ?? 0.0,
      descripcion: _descripcionController.text,
      imagenSrc: '',
      metodoPago: '',
      fechaVencimiento: '',
      idCategoria: _categoriaSeleccionada!.id!,
    );

    await _appService.actualizarProducto(producto);
    if (mounted) Navigator.pop(context);
  }

  Future<void> _eliminarProducto() async {
    if (_codigoProducto == null) return;
    await _appService.eliminarProducto(_codigoProducto!);
    if (mounted) Navigator.pop(context);
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
        title: const Text("Actualizar Producto"),
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
                    const Icon(Icons.upload_file, size: 70, color: Colors.black54),
                    const SizedBox(height: 20),

                    TextFormField(
                      controller: _nombreController,
                      decoration: _inputDecoration("Nombre del Producto"),
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _stockController,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration("Cantidad Disponible"),
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _precioController,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration("Precio"),
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _costoController,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration("Costo"),
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
                        onPressed: _actualizarProducto,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[400],
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text("Actualizar Producto"),
                      ),
                    ),
                    const SizedBox(height: 10),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _eliminarProducto,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text("Eliminar Producto"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}