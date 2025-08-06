import 'package:flutter/material.dart';
import 'package:miki/models/categoria.dart';
import 'package:miki/models/productos.dart';
import 'package:miki/screens/home/menuPrincipal.dart';
import 'package:miki/service/super_service.dart';

class ActualizarProductosScreen extends StatefulWidget {
  final String nombreProducto;

  const ActualizarProductosScreen({super.key, required this.nombreProducto});

  @override
  State<ActualizarProductosScreen> createState() => _ActualizarProductosScreenState();
}

class _ActualizarProductosScreenState extends State<ActualizarProductosScreen> {
  final _formKey = GlobalKey<FormState>();
  final AppService _appService = AppService();

  TextEditingController _nombreController = TextEditingController();
  TextEditingController _stockController = TextEditingController();
  TextEditingController _precioController = TextEditingController();
  TextEditingController _costoController = TextEditingController();
  TextEditingController _descripcionController = TextEditingController();

  int? categoriaSeleccionadaId;
  String? codigoProducto;
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
        _nombreController.text = producto.nombre;
        _stockController.text = producto.stock.toString();
        _precioController.text = producto.precio.toString();
        _costoController.text = producto.costo.toString();
        _descripcionController.text = producto.descripcion ?? '';
        _categorias = categorias;
        categoriaSeleccionadaId = producto.idCategoria;
        codigoProducto = producto.codigo;
      });
    } else {
      // En caso de no encontrar producto, solo carga las categorías
      setState(() {
        _categorias = categorias;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Actualizar Producto"),
        backgroundColor: Colors.blue[400],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/menuPrincipal'))
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
                    // Acción para subir imagen (opcional)
                  },
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: "Nombre del Producto",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingrese el nombre del producto';
                  return null;
                },
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: _stockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Cantidad Disponible",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingrese la cantidad disponible';
                  if (int.tryParse(value) == null) return 'Ingrese un número válido';
                  return null;
                },
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: _precioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Precio",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingrese el precio';
                  if (double.tryParse(value) == null) return 'Ingrese un número válido';
                  return null;
                },
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: _costoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Costo",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingrese el costo';
                  if (double.tryParse(value) == null) return 'Ingrese un número válido';
                  return null;
                },
              ),
              const SizedBox(height: 10),

              DropdownButtonFormField<int>(
                value: categoriaSeleccionadaId,
                decoration: const InputDecoration(
                  labelText: "Categoría",
                  border: OutlineInputBorder(),
                ),
                items: _categorias.map((cat) => DropdownMenuItem<int>(
                  value: cat.id,
                  child: Text(cat.nombre),
                )).toList(),
                onChanged: (value) {
                  setState(() {
                    categoriaSeleccionadaId = value;
                  });
                },
                validator: (value) {
                  if (value == null) return 'Seleccione una categoría';
                  return null;
                },
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: _descripcionController,
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate() && codigoProducto != null && categoriaSeleccionadaId != null) {
                      final producto = Producto(
                        codigo: codigoProducto!,
                        nombre: _nombreController.text,
                        precio: double.parse(_precioController.text),
                        stock: int.parse(_stockController.text),
                        costo: double.parse(_costoController.text),
                        descripcion: _descripcionController.text,
                        fechaVencimiento: '2025-12-31',
                        imagenSrc: '',
                        metodoPago: 'Efectivo',
                        idCategoria: categoriaSeleccionadaId,
                      );

                      await _appService.actualizarProducto(producto);

                      if (mounted) Navigator.pop(context);
                    }
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
                  onPressed: () async {
                    if (codigoProducto != null) {
                      await _appService.eliminarProducto(codigoProducto!);
                      if (mounted) Navigator.pop(context);
                    }
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
}
