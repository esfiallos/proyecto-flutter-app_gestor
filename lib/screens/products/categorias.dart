import 'package:flutter/material.dart';


class CategoriaManager extends StatefulWidget {
  const CategoriaManager({super.key});

  @override
  _CategoriaManagerState createState() => _CategoriaManagerState();
}

enum Modo { lista, crear, editar }

class _CategoriaManagerState extends State<CategoriaManager> {
  List<String> categorias = ['Libros', 'Juegos', 'Ropa'];
  Modo modo = Modo.lista;
  String? categoriaSeleccionada;
  final TextEditingController _controller = TextEditingController();
  bool habilitarBoton = false;

  void _mostrarCrear() {
    setState(() {
      modo = Modo.crear;
      _controller.clear();
      habilitarBoton = false;
    });
  }

  void _mostrarEditar(String categoria) {
    setState(() {
      modo = Modo.editar;
      categoriaSeleccionada = categoria;
      _controller.text = categoria;
      habilitarBoton = false;
    });
  }

  void _crearCategoria() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        categorias.add(_controller.text.trim());
        modo = Modo.lista;
      });
    }
  }

  void _actualizarCategoria() {
    if (_controller.text.trim().isNotEmpty && categoriaSeleccionada != null) {
      int index = categorias.indexOf(categoriaSeleccionada!);
      setState(() {
        categorias[index] = _controller.text.trim();
        modo = Modo.lista;
      });
    }
  }

  void _eliminarCategoria() {
    if (categoriaSeleccionada != null) {
      setState(() {
        categorias.remove(categoriaSeleccionada);
        modo = Modo.lista;
      });
    }
  }

  Widget _buildBotonCategoria(String categoria) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[850],
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: () => _mostrarEditar(categoria),
      icon: Icon(Icons.folder, color: Colors.amber),
      label: Text(
        categoria,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _buildFormulario({required bool esEdicion}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          esEdicion ? 'Editar Categoría' : 'Crear Categoría',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 16),
        TextField(
          controller: _controller,
          onChanged: (text) {
            setState(() {
              habilitarBoton = text.trim().isNotEmpty &&
                  (modo == Modo.crear || text.trim() != categoriaSeleccionada);
            });
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[800],
            labelText: 'Nombre de la categoría',
            labelStyle: TextStyle(color: Colors.white70),
            border: OutlineInputBorder(),
          ),
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 24),
        Row(
          children: [
            if (esEdicion)
              Expanded(
                child: ElevatedButton(
                  onPressed: habilitarBoton ? _actualizarCategoria : null,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('Actualizar'),
                ),
              ),
            if (esEdicion) SizedBox(width: 12),
            if (esEdicion)
              Expanded(
                child: ElevatedButton(
                  onPressed: _eliminarCategoria,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Eliminar'),
                ),
              ),
            if (!esEdicion)
              Expanded(
                child: ElevatedButton(
                  onPressed: habilitarBoton ? _crearCategoria : null,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Crear'),
                ),
              ),
          ],
        ),
        SizedBox(height: 12),
        TextButton(
          onPressed: () {
            setState(() {
              modo = Modo.lista;
            });
          },
          child: Text('Cancelar', style: TextStyle(color: Colors.white70)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Categorías'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: modo == Modo.lista
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton.icon(
                    onPressed: _mostrarCrear,
                    icon: Icon(Icons.add),
                    label: Text('Nueva Categoría'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemCount: categorias.length,
                      itemBuilder: (context, index) => _buildBotonCategoria(categorias[index]),
                      separatorBuilder: (_, __) => SizedBox(height: 10),
                    ),
                  ),
                ],
              )
            : _buildFormulario(esEdicion: modo == Modo.editar),
      ),
    );
  }
}
