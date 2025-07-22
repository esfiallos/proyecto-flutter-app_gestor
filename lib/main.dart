import 'package:flutter/material.dart';
import 'package:miki/models/databasehelper.dart';
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
      initialRoute: AppRoutes.inicio,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}