import 'package:flutter/material.dart';
import 'package:miki/screens/auth/bienvenida.dart';
import 'package:miki/screens/auth/buscarCorreo.dart';
import 'package:miki/screens/auth/creacionCuenta.dart';
import 'package:miki/screens/auth/inicio.dart';
import 'package:miki/screens/auth/lugar.dart';
import 'package:miki/screens/auth/restablecerContrasena.dart';
import 'package:miki/screens/estadistica/balance.dart';
import 'package:miki/screens/gastos/nuevo%20gasto.dart';
import 'package:miki/screens/home/log_out.dart';
import 'package:miki/screens/home/menuPrincipal.dart' as home_menu;
import 'package:miki/screens/auth/login.dart';
import 'package:miki/screens/inventario/GestionInventarioPage.dart';
import 'package:miki/screens/inventario/inventario.dart';
import 'package:miki/screens/products/categorias.dart';
import 'package:miki/screens/products/registrarP.dart';
import 'package:miki/screens/profile/My_Products.dart';
import 'package:miki/screens/profile/edit_profile.dart';
import 'package:miki/screens/profile/profile.dart';
import 'package:miki/screens/estadistica/statistics.dart';
import 'package:miki/screens/ventas/venta_libre_page.dart';
import 'package:miki/screens/ventas/venta_page.dart';


class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String productos = '/productos';
  static const String perfil = '/perfil';
  static const String lugar = '/lugar';
  static const String inicio = '/inicio';
  static const String bienvenida = '/bienvenida';
  static const String buscarCorreo = '/buscar-correo';
  static const String creacionCuenta = '/crear-cuenta';
  static const String restablecerContrasena = '/restablecer-contrasena';
  static const String estadistica = '/estadistica';
  static const String balance = '/balance';
  static const String inventario = '/inventario';
  static const String profile = '/profile';
  static const String editProfile = '/editar-perfil';
  static const String misProductos = '/MyProducts';
  static const String registrarProducto = '/registrar-producto';
  static const String gestioInventario = '/gestion-inventario';
  static const String logOut = '/log-out';
  static const String nuevoGasto = '/nuevoGasto'; 
  static const String categorias = '/categorias';
  static const String ventaLibre = '/venta-libre';
  static const String ventaProductos = '/venta-productos';




  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const home_menu.MenuPrincipal());
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case productos:
        return MaterialPageRoute(builder: (_) => const MyProducts());
      case perfil:
        return MaterialPageRoute(builder: (_) => const Profile());
      case lugar:
        return MaterialPageRoute(builder: (_) => const Lugar());
        case inicio:
        return MaterialPageRoute(builder: (_) => const Inicio());
        case bienvenida:
        return MaterialPageRoute(builder: (_) => const Bienvenida());
        case buscarCorreo:
        return MaterialPageRoute(builder: (_) => const BuscarCorreoScreen());
        case creacionCuenta:
               return MaterialPageRoute(builder: (_) => const CreacionCuentaScreen());

        case estadistica:
                return MaterialPageRoute(builder: (_) => const StatisticsScreen());

        case balance:
        return MaterialPageRoute(builder: (_) => const Balance());
        case inventario:
        return MaterialPageRoute(builder: (_) => const InventarioPage());
        case profile:
        return MaterialPageRoute(builder: (_) => const Profile());
        case editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfile());
        case misProductos:
        return MaterialPageRoute(builder: (_) => const MyProducts());
        case registrarProducto:
        return MaterialPageRoute(builder: (_) => const CrearProductoScreen());
        case gestioInventario:
        return MaterialPageRoute(builder: (_) => const GestionInventarioPage());
        case logOut:
        return MaterialPageRoute(builder: (_) => const LogOut());
        case nuevoGasto:
        return MaterialPageRoute(builder: (_) => const NuevoGasto());
        case categorias:
        return MaterialPageRoute(builder: (_) => const CategoriaManager());
        case ventaLibre:
        return MaterialPageRoute(builder: (_) => const VentaLibrePage());
      case ventaProductos:
        return MaterialPageRoute(builder: (_) => const VentaProductosPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Ruta no encontrada: ${settings.name}')),
          ),
        );
    }
  }
}