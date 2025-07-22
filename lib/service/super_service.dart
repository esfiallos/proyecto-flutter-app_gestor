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
}
