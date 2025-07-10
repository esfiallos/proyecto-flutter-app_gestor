import 'package:flutter/material.dart';

class lugar extends StatelessWidget {
  const lugar({super.key});

  final List<Map<String, String>> paises = const [
    {'nombre': 'English', 'imagen': 'assets/usa.png'},
    {'nombre': 'Honduras', 'imagen': 'assets/honduras.png'},
    {'nombre': 'Franch', 'imagen': 'assets/brasil.png'},
    {'nombre': 'Spanish', 'imagen': 'assets/espana.png'},
    {'nombre': 'America', 'imagen': 'assets/japon.png'},
    {'nombre': 'Vietnam', 'imagen': 'assets/vietnam.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Círculo morado superior izquierdo
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

          // Círculo azul inferior derecho
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

          // Contenido principal
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Flecha y título más abajo (100)
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 16.0, right: 16.0),
                  child: Row(
                    children: const [
                      Icon(Icons.arrow_back_ios, size: 20),
                      SizedBox(width: 8),
                      Text("Pais", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Campo de búsqueda
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar Pais',
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
                    itemCount: paises.length,
                    itemBuilder: (context, index) {
                      final pais = paises[index];
                      return InkWell(
                        onTap: () {
                          // lógica al tocar un país
                        },
                        child: ListTile(
                          leading: Image.asset(
                            pais['imagen']!,
                            width: 32,
                            height: 32,
                          ),
                          title: Text(pais['nombre']!),
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
