import 'package:flutter/material.dart';

class Lugar extends StatefulWidget {
  const Lugar({super.key});

  @override
  State<Lugar> createState() => _LugarState();
}

class _LugarState extends State<Lugar> {
  final List<Map<String, String>> todosLosPaises = const [
    {'nombre': 'Honduras', 'imagen': 'assets/honduras.png'},
    {'nombre': 'México', 'imagen': 'assets/mexico.png'},
    {'nombre': 'España', 'imagen': 'assets/espana.png'},
    {'nombre': 'Argentina', 'imagen': 'assets/argentina.png'},
    {'nombre': 'Colombia', 'imagen': 'assets/colombia.png'},
    {'nombre': 'Perú', 'imagen': 'assets/peru.png'},
  ];

  List<Map<String, String>> paisesFiltrados = [];
  int? seleccionadoIndex;

  @override
  void initState() {
    super.initState();
    paisesFiltrados = List.from(todosLosPaises);
  }

  void filtrarPaises(String query) {
    setState(() {
      paisesFiltrados = todosLosPaises
          .where((pais) =>
              pais['nombre']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      seleccionadoIndex = null; // Limpiar selección al buscar
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool haySeleccion = seleccionadoIndex != null;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: haySeleccion
            ? () {
                Navigator.pushNamed(
                  context,
                  '/login',
                  arguments: paisesFiltrados[seleccionadoIndex!],
                );
              }
            : null,
        label: const Text('Continuar'),
        icon: const Icon(Icons.arrow_forward),
        backgroundColor:
            haySeleccion ? Colors.blueAccent : Colors.grey.shade400,
      ),
      body: Stack(
        children: [
          // Decoración
          Positioned(
            top: -80,
            left: -80,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            right: -60,
            child: Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Encabezado
                Padding(
                  padding:
                      const EdgeInsets.only(top: 100, left: 16.0, right: 16.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, size: 20),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Selecciona tu país",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Buscador
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    onChanged: filtrarPaises,
                    decoration: InputDecoration(
                      hintText: 'Buscar país',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Lista de países
                Expanded(
                  child: ListView.builder(
                    itemCount: paisesFiltrados.length,
                    itemBuilder: (context, index) {
                      final pais = paisesFiltrados[index];
                      final esSeleccionado = index == seleccionadoIndex;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            seleccionadoIndex = index;
                          });
                        },
                        child: Container(
                          color: esSeleccionado
                              ? Colors.blue.shade100
                              : Colors.transparent,
                          child: ListTile(
                            leading: Image.asset(
                              pais['imagen']!,
                              width: 32,
                              height: 32,
                            ),
                            title: Text(
                              pais['nombre']!,
                              style: TextStyle(
                                fontWeight: esSeleccionado
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            trailing: esSeleccionado
                                ? const Icon(Icons.check_circle,
                                    color: Colors.blue)
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}