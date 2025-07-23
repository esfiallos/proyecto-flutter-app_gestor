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

  Future<Usuario?> obtenerCorreoPorCorreo(String correo) async {
    return await UsuarioDAO.getByCorreo(correo);
  }

  Future<List<Usuario>> obtenerTodosUsuarios() async {
    return await UsuarioDAO.getAll();
  }

  /// Actualizar usuario completo (no solo contraseña)
  Future<int> actualizarUsuario(Usuario usuario) async {
    return await UsuarioDAO.update(usuario);
  }

  /// Actualizar solo contraseña por correo
  Future<void> actualizarContrasena(String correo, String nuevaContrasena) async {
    await UsuarioDAO.actualizarContrasena(correo, nuevaContrasena);
  }

  /// CATEGORÍAS
  Future<List<Categoria>> obtenerCategorias() async {
    return await CategoriaDAO.getAll();
  }

  Future<void> insertarCategoriasPrueba() async {
    final categoriasPrueba = [
      Categoria(id: 1, nombre: 'Bebidas'),
      Categoria(id: 2, nombre: 'Snacks'),
      Categoria(id: 3, nombre: 'Postres'),
    ];

    for (var c in categoriasPrueba) {
      final existe = await CategoriaDAO.getById(c.id!);
      if (existe == null) {
        await CategoriaDAO.insert(c);
      }
    }
  }

  /// PRODUCTOS
  Future<int> registrarProducto(Producto p) async {
    return await ProductoDAO.insert(p);
  }

  Future<List<Producto>> obtenerProductos() async {
    return await ProductoDAO.getAll();
  }

  Future<Producto?> obtenerProductoPorId(String codigo) async {
    return await ProductoDAO.getById(codigo);
  }

  Future<int> actualizarProducto(Producto p) async {
    return await ProductoDAO.update(p);
  }

  Future<int> eliminarProducto(String codigo) async {
    return await ProductoDAO.delete(codigo);
  }

  /// VENTAS
  Future<int> registrarVentaCompleta(
    Venta venta,
    List<DetalleVenta> detalles,
  ) async {
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

  /// ✅ Insertar categorías y productos de prueba
  Future<void> insertarDatosPrueba() async {
    await insertarCategoriasPrueba(); // Agregamos categorías primero

    final productosPrueba = [
      Producto(
        codigo: 'P001',
        nombre: 'Agua Mineral',
        precio: 12.5,
        stock: 10,
        costo: 5.0,
        descripcion: 'Botella de agua 500ml',
        fechaVencimiento: '2025-12-31',
        imagenSrc: '',
        metodoPago: 'Efectivo',
        idCategoria: 1, // Bebidas
      ),
      Producto(
        codigo: 'P002',
        nombre: 'Chips BBQ',
        precio: 18.0,
        stock: 25,
        costo: 8.0,
        descripcion: 'Bolsa de papas BBQ',
        fechaVencimiento: '2026-01-01',
        imagenSrc: '',
        metodoPago: 'Tarjeta',
        idCategoria: 2, // Snacks
      ),
    ];

    for (var p in productosPrueba) {
      final existe = await ProductoDAO.getById(p.codigo);
      if (existe == null) {
        await ProductoDAO.insert(p);
      }
    }
  }

  Future<void> insertarUsuariosPrueba() async {
    final usuariosPrueba = [
      Usuario(
        id: 1,
        nombre: 'danerys',
        correo: 'danerys@example.com',
        apellido: '',
        contrasena: '',
      ),
      Usuario(
        id: 2,
        nombre: 'usuario1',
        correo: 'usuario1@example.com',
        apellido: '',
        contrasena: 'abcd',
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