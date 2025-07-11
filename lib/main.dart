import 'package:flutter/material.dart';
import 'package:miki/bienvenida.dart';
import 'package:miki/My_Products.dart';
import 'package:miki/menuPrincipal.dart';
import 'package:miki/statistics.dart';
import 'package:miki/profile.dart';
import 'package:miki/log_out.dart';

/// ⚙️ Cambiá este valor a `false` para ejecutar la app normal (producción)
const bool devMode = true;

void main() {
  runApp(const MyApp());
}

/// 🌐 App principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIKI APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // 👇 Cambia la pantalla inicial si estás en modo desarrollo
      home: devMode ? const Playground() : const bienvenida(),
    );
  }
}

/// 🧪 Pantalla de pruebas
class Playground extends StatelessWidget {
  const Playground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantallas de Prueba"),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Ir al flujo real',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const bienvenida()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Pantalla Principal"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const menuPrincipal())),
          ),
          ListTile(
            title: const Text("Estadísticas"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Statistics())),
          ),
          ListTile(
            title: const Text("Perfil"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Profile())),
          ),
          ListTile(
            title: const Text("Bienvenida"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const bienvenida())),
          ),
          ListTile(
            title: const Text("Mis Productos"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MyProducts())),
          ),
          ListTile(
            title: const Text("Cerrar sesión"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LogOut())),
          ),
        ],
      ),
    );
  }
}