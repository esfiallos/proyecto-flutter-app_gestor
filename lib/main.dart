import 'package:flutter/material.dart';
import 'package:miki/bd/databasehelper.dart';
import 'package:miki/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Database db = await DatabaseHelper.instance.database;

  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('userId');

  runApp(
    Provider<Database>.value(
      value: db,
      child: MyApp(
        isLoggedIn: userId != null,
      ),
    ),
  );
}


class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIKI APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: isLoggedIn ? AppRoutes.menu : AppRoutes.login,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
