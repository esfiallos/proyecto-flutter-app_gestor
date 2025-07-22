import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:miki/routes/app_routes.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  void initState() {
    super.initState();
    _cerrarSesionYRedirigir();
  }

  Future<void> _cerrarSesionYRedirigir() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Esperamos 2 segundos para mostrar la pantalla de despedida
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Redirigimos al login eliminando historial
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Círculos decorativos
          Positioned(top: -100, left: -100, child: _circle(220, Colors.purple)),
          Positioned(top: -80, right: -80, child: _circle(180, Colors.blue)),
          Positioned(top: -20, right: -20, child: _circle(60, Colors.pink)),
          Positioned(bottom: -10, left: -20, child: _circle(50, Colors.pink)),
          Positioned(bottom: -80, left: 20, child: _circle(160, Colors.purple)),
          Positioned(bottom: -60, right: -60, child: _circle(150, Colors.blue)),

          // Icono para volver (si lo quieres conservar)
          Positioned(
            top: 20,
            left: 5,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 28),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Contenido central
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.blue, Colors.purple, Colors.pink],
                  ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: const Text(
                    'Hasta luego!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.7),
        shape: BoxShape.circle,
      ),
    );
  }
}
