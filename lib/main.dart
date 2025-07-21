import 'package:flutter/material.dart';
import 'package:miki/screens/auth/bienvenida.dart';
import 'package:miki/screens/products/My_Products.dart';
import 'package:miki/screens/home/menuPrincipal.dart';
import 'package:miki/screens/estadistica/statistics.dart';
import 'package:miki/screens/profile/profile.dart';
import 'package:miki/screens/home/log_out.dart';
import 'package:miki/screens/auth/inicio.dart';
import 'package:miki/screens/auth/login.dart';
import 'package:miki/screens/auth/creacionCuenta.dart';
import 'package:miki/screens/auth/restablecerContrasena.dart';
import 'package:miki/screens/profile/edit_profile.dart';
import 'package:miki/screens/products/registrarP.dart';
import 'package:miki/screens/inventario/GestionInventarioPage.dart';
import 'package:miki/screens/products/seleccionarP.dart'; 
import 'package:miki/screens/inventario/inventario.dart';
import 'package:miki/screens/inventario/canasta.dart';
import 'package:miki/screens/auth/buscarCorreo.dart';
import 'package:miki/screens/products/actualizar.dart';
import 'package:miki/screens/estadistica/balance.dart';
import 'package:miki/screens/auth/lugar.dart';
import 'package:miki/screens/inventario/nuevo gasto.dart';
import 'package:miki/routes/app_routes.dart';


const bool devMode = true; // Cambia a false para producción

void main() async {

    runApp( const MyApp(),);
}


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
      initialRoute: devMode ? AppRoutes.playground : AppRoutes.inicio,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

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
                MaterialPageRoute(builder: (_) => const Inicio()),
              );
            },
          ),
        ],
      ),
            body: ListView(
  children: [
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
    ),
    _buildTile(context, "Pantalla Principal", const menuPrincipal()),
    _buildTile(context, "Inicio", const Inicio()),
    _buildTile(context, "Bienvenida", const Bienvenida()),
    _buildTile(context, "Buscar Correo", const BuscarCorreo()),
    _buildTile(context, "Actualizar", const CrearProductoScreen()),
    _buildTile(context, "Lugar", const Lugar()),

    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Auth", style: TextStyle(fontWeight: FontWeight.bold)),
    ),
    _buildTile(context, "Login", const Login()),
    _buildTile(context, "Crear Cuenta", const CreacionCuenta()),
    _buildTile(context, "Restablecer Contraseña", const RestablecerContrasena()),
    _buildTile(context, "Cerrar sesión", const LogOut()),

    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Perfil", style: TextStyle(fontWeight: FontWeight.bold)),
    ),
    _buildTile(context, "Perfil", const Profile()),
    _buildTile(context, "Editar Perfil", const EditProfile()),

    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Productos", style: TextStyle(fontWeight: FontWeight.bold)),
    ),
    _buildTile(context, "Mis Productos", const MyProducts()),
    _buildTile(context, "Registrar Producto", const RegistrarProductoPage()),
    _buildTile(context, "Editar Producto", const GestionInventarioPage()),
    _buildTile(context, "Seleccionar Producto", const ProductSelectionScreen()),

    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Inventario", style: TextStyle(fontWeight: FontWeight.bold)),
    ),
    _buildTile(context, "Inventario", const InventarioPage()),
    _buildTile(context, "Canasta", const ConfirmarCantidadesPage()),
     _buildTile(context, "Nuevo Gasto",  NuevoGasto()),

    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Estadísticas", style: TextStyle(fontWeight: FontWeight.bold)),
    ),
        _buildTile(context, "Estadísticas", const Statistics()),
        _buildTile(context, "Balance", const Balance()),
  ],
),
    );
  }
}

Widget _buildTile(BuildContext context, String title, Widget screen) {
  return ListTile(
    title: Text(title),
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    ),
  );
}
