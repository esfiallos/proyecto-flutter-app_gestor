import 'package:flutter/material.dart';
import 'package:miki/models/views/stock_productos.dart';
import 'package:miki/models/categoria.dart';
import 'package:miki/service/super_service.dart';
import 'package:miki/widgets/MenuBar.dart';

class InventarioPage extends StatefulWidget {
  const InventarioPage({super.key});

  @override
  State<InventarioPage> createState() => _InventarioPageState();
}

class _InventarioPageState extends State<InventarioPage> {
  final AppService _appService = AppService();

  List<StockProducto> _productos = [];
  List<Categoria> _categorias = [];
  String _categoriaSeleccionada = 'Todas';

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    final categorias = await _appService.obtenerCategorias();
    final productos = await _appService.obtenerStockActual();

    setState(() {
      _categorias = [Categoria(id: null, nombre: 'Todas'), ...categorias];
      _productos = productos;
    });
  }

  // Obtener nombre categoría por id
  String _getNombreCategoria(int? id) {
    if (id == null) return 'Sin categoría';
    final cat = _categorias.firstWhere(
      (c) => c.id == id,
      orElse: () => Categoria(id: null, nombre: 'Desconocida'),
    );
    return cat.nombre;
  }

  // Filtrar productos según categoría seleccionada
  List<StockProducto> get _productosFiltrados {
    if (_categoriaSeleccionada == 'Todas') return _productos;
    final cat = _categorias.firstWhere(
      (c) => c.nombre == _categoriaSeleccionada,
      orElse: () => Categoria(id: null, nombre: ''),
    );
    if (cat.id == null) return [];
    return _productos.where((p) => p.idCategoria == cat.id).toList();
  }

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
                Navigator.pushReplacementNamed(context, '/registrar-producto');
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total de Referencias',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${_productos.length}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Costo Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'L${_productos.fold<double>(0, (sum, p) => sum + p.costo)}',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categorias.map((cat) {
                  final selected = _categoriaSeleccionada == cat.nombre;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(cat.nombre),
                      selected: selected,
                      onSelected: (bool selected) {
                        setState(() {
                          _categoriaSeleccionada = cat.nombre;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: _productosFiltrados.isEmpty
                ? const Center(child: Text('No hay productos'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _productosFiltrados.length,
                    itemBuilder: (context, index) {
                      final producto = _productosFiltrados[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            // Imagen o placeholder
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey[200],
                                image: producto.imagen != null && producto.imagen!.isNotEmpty
                                    ? DecorationImage(
                                        image: NetworkImage(producto.imagen!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: producto.imagen == null || producto.imagen!.isEmpty
                                  ? const Icon(Icons.image_not_supported, color: Colors.grey, size: 30)
                                  : null,
                            ),

                            const SizedBox(width: 16),

                            // Información del producto
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/gestion-inventario',
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      producto.nombre,
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    const SizedBox(height: 4),
                                    Text('Stock: ${producto.stock}'),
                                    Text('Precio: L${producto.precio.toStringAsFixed(2)}'),
                                    Text('Categoría: ${_getNombreCategoria(producto.idCategoria)}'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),

      bottomNavigationBar: const MenuBarraAbajo(currentIndex: 3),
    );
  }
}
