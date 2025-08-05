import 'package:flutter/material.dart';
import 'package:miki/bd/databasehelper.dart';
import 'package:miki/models/categoria.dart';
import 'package:miki/service/super_service.dart';

class RegistrarProductoPage extends StatefulWidget {
  const RegistrarProductoPage({super.key});

  @override
  State<RegistrarProductoPage> createState() => _RegistrarProductoPageState();
}

class _RegistrarProductoPageState extends State<RegistrarProductoPage> {
  final AppService _appService = AppService();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController costoController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController fechaVencimientoController = TextEditingController();

  bool mostrarFecha = false;

  List<Categoria> _categorias = [];
  Categoria? _categoriaSeleccionada;

  @override
  void initState() {
    super.initState();
    _cargarCategorias();
  }

  Future<void> _cargarCategorias() async {
    final cats = await _appService.obtenerCategorias();
    setState(() {
      // Añade una opción por defecto al inicio
      _categorias = [Categoria(id: null, nombre: 'Selecciona una opción'), ...cats];
      _categoriaSeleccionada = _categorias.first;
    });
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
            "${picked.year}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}";
      });
    }
  }

  Future<void> _crearProducto() async {
    if (nombreController.text.isEmpty ||
        cantidadController.text.isEmpty ||
        precioController.text.isEmpty ||
        costoController.text.isEmpty ||
        _categoriaSeleccionada == null ||
        _categoriaSeleccionada!.id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
      );
      return;
    }

    final db = await DatabaseHelper.instance.database;

    await db.insert(
      'Productos',
      {
        'codigo': DateTime.now().millisecondsSinceEpoch.toString(),
        'nombre': nombreController.text,
        'stock': int.tryParse(cantidadController.text) ?? 0,
        'precio': double.tryParse(precioController.text) ?? 0.0,
        'costo': double.tryParse(costoController.text) ?? 0.0,
        'descripcion': descripcionController.text,
        'fecha_vencimiento':
            mostrarFecha ? fechaVencimientoController.text : null,
        'imagen_src': '',
        'metodo_pago': '',
        'id_categoria': _categoriaSeleccionada!.id,
      },
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Producto creado exitosamente')),
    );
    Navigator.pop(context);
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Producto'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _categorias.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Icon(Icons.upload_file,
                      size: 70, color: Colors.black54),
                  const SizedBox(height: 16),
                  TextField(
                    controller: nombreController,
                    decoration: _inputDecoration('Nombre del Producto'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: cantidadController,
                    keyboardType: TextInputType.number,
                    decoration: _inputDecoration('Cantidad Disponible'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: precioController,
                    keyboardType: TextInputType.number,
                    decoration: _inputDecoration('Precio'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: costoController,
                    keyboardType: TextInputType.number,
                    decoration: _inputDecoration('Costo'),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<Categoria>(
                    value: _categoriaSeleccionada,
                    decoration: _inputDecoration('Categoría'),
                    items: _categorias.map((cat) {
                      return DropdownMenuItem<Categoria>(
                        value: cat,
                        child: Text(cat.nombre),
                      );
                    }).toList(),
                    onChanged: (cat) {
                      setState(() {
                        _categoriaSeleccionada = cat;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: descripcionController,
                    decoration: _inputDecoration('Descripción'),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Checkbox(
                        value: mostrarFecha,
                        onChanged: (v) {
                          setState(() {
                            mostrarFecha = v ?? false;
                            if (!mostrarFecha) {
                              fechaVencimientoController.clear();
                            }
                          });
                        },
                      ),
                      const Text('¿Agregar fecha de vencimiento?'),
                    ],
                  ),
                  if (mostrarFecha) ...[
                    const SizedBox(height: 8),
                    TextField(
                      controller: fechaVencimientoController,
                      readOnly: true,
                      onTap: () => _seleccionarFecha(context),
                      decoration: _inputDecoration('Fecha de Vencimiento'),
                    ),
                  ],
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
}
