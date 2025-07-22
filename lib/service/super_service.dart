import 'package:miki/controller/super_dao.dart';
import 'package:miki/controller/vies_dao.dart';
import 'package:miki/models/productos.dart';
import 'package:miki/models/views/balance_general.dart';
import 'package:miki/models/views/egreso_metodo_pago.dart';
import 'package:miki/models/views/metodo_pago_mayor.dart';
import 'package:miki/models/views/producto_mas_vendido.dart';
import 'package:miki/models/views/producto_masvendido_mes.dart';
import 'package:miki/models/views/producto_menovendido_mes.dart';
import 'package:miki/models/views/stock_productos.dart';
import 'package:miki/models/views/ventas_metodo_pago.dart';
import '../models/usuario.dart';
import '../models/categoria.dart';
import '../models/venta.dart';
import '../models/detalle_venta.dart';
import '../models/gasto.dart';



class AppService {
  /// USUARIOS
  Future<int> registrarUsuario(Usuario usuario) async {

    return await UsuarioDAO.insert(usuario);
  }

  Future<Usuario?> obtenerUsuarioPorId(int id) async {
    return await UsuarioDAO.getById(id);
  }

  Future<List<Usuario>> obtenerTodosUsuarios() async {
    return await UsuarioDAO.getAll();
  }

  /// CATEGORÍAS
  Future<List<Categoria>> obtenerCategorias() async {
    return await CategoriaDAO.getAll();
  }

  /// PRODUCTOS
  Future<int> registrarProducto(Producto p) async {
    return await ProductoDAO.insert(p);
  }

  Future<List<Producto>> obtenerProductos() async {
    return await ProductoDAO.getAll();
  }

  Future<Producto?> obtenerProductoPorId(int id) async {
    return await ProductoDAO.getById(id);
  }

  Future<int> actualizarProducto(Producto p) async {
    return await ProductoDAO.update(p);
  }

  Future<int> eliminarProducto(int id) async {
    return await ProductoDAO.delete(id);
  }

  /// VENTAS
  Future<int> registrarVentaCompleta(Venta venta, List<DetalleVenta> detalles) async {
    final ventaId = await VentaDAO.insert(venta);
    for (var detalle in detalles) {
      await DetalleVentaDAO.insert(detalle.copyWith(idVenta: ventaId));
    }
    return ventaId;
  }

  Future<List<Venta>> obtenerVentas() async {
    return await VentaDAO.getAll();
  }

  /// GASTOS
  Future<int> registrarGasto(Gasto gasto) async {
    return await GastoDAO.insert(gasto);
  }

  Future<List<Gasto>> obtenerGastos() async {
    return await GastoDAO.getAll();
  }

  /// STOCK / VISTAS
  Future<List<StockProducto>> obtenerStockActual() async {
    return await ViewsDAO.getStockProductos();
  }

  Future<BalanceGeneral> obtenerBalance() async {
    return await ViewsDAO.getBalanceGeneral();
  }

  Future<List<VentasPorMetodoPago>> obtenerVentasPorMetodoPago() async {
    return await ViewsDAO.getVentasPorMetodoPago();
  }

  Future<List<EgresosPorMetodoPago>> obtenerEgresosPorMetodoPago() async {
    return await ViewsDAO.getEgresosPorMetodoPago();
  }

  Future<ProductoMasVendido?> obtenerProductoMasVendido() async {
    return await ViewsDAO.getProductoMasVendido();
  }

  Future<List<ProductoMasVendidoPorMes>> obtenerProductosMasVendidosPorMes() async {
    return await ViewsDAO.getProductosMasVendidosPorMes();
  }

  Future<List<ProductoMenosVendidoPorMes>> obtenerProductosMenosVendidosPorMes() async {
    return await ViewsDAO.getProductosMenosVendidosPorMes();
  }

  Future<MetodoPagoMasUsado?> obtenerMetodoPagoMasUsado() async {
    return await ViewsDAO.getMetodoPagoMasUsado();
  }




  Future<void> insertarDatosPrueba() async {
  final productosPrueba = [
    Producto(id: 1, nombre: 'Producto Demo 1', precio: 100.0, imagen: '', codigo: '', stock: 1, costo: 50),
    Producto(id: 2, nombre: 'Producto Demo 2', precio: 150.5, imagen: '', codigo: '', stock: 12, costo: 5),
    Producto(id: 3, nombre: 'Producto Demo 3', precio: 75.0, imagen: '', codigo: '', stock: 7, costo: 5),
  ];

  for (var p in productosPrueba) {
    final existe = await ProductoDAO.getById(p.id!);
    if (existe == null) {  // Solo insertar si no existe
      await ProductoDAO.insert(p);
    }
  }

  // También puedes insertar otros datos de prueba para balance, gastos, etc. según necesites.
}

Future<void> insertarUsuariosPrueba() async {
  final usuariosPrueba = [
    Usuario(
      id: 1,
      nombre: 'danerys',
      correo: 'danerys@example.com',apellido: '', contrasena: '',
    ),
    Usuario(
      id: 2,
      nombre: 'usuario1',
      correo: 'usuario1@example.com', apellido: '', contrasena: 'abcd',
    ),
  ];

  for (var u in usuariosPrueba) {
    final existe = await UsuarioDAO.getById(u.id!);
    if (existe == null) {
      await UsuarioDAO.insert(u);
    }
  }
}
}
