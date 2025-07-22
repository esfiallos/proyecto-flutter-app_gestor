import 'package:flutter/material.dart';
import 'package:miki/models/databasehelper.dart';
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
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';



void main() async {
 WidgetsFlutterBinding.ensureInitialized();

  // Abre la base de datos usando tu helper
  final Database db = await DatabaseHelper.instance.database;

  // Ejecuta la app pasando la instancia DB con Provider
  runApp(
    Provider<Database>.value(
      value: db,
      child: const MyApp(),
    ),
  );


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
      initialRoute: AppRoutes.inicio,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
