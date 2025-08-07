import 'package:miki/models/views/balance_general.dart';
import 'package:miki/models/views/egreso_metodo_pago.dart';
import 'package:miki/models/views/metodo_pago_mayor.dart';
import 'package:miki/models/views/producto_mas_vendido.dart';
import 'package:miki/models/views/producto_masvendido_mes.dart';
import 'package:miki/models/views/producto_menovendido_mes.dart';
import 'package:miki/models/views/stock_productos.dart';
import 'package:miki/models/views/ventas_metodo_pago.dart';
import 'package:miki/bd/databasehelper.dart';



class ViewsDAO {
  static Future<BalanceGeneral> getBalanceGeneral() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.rawQuery('SELECT * FROM View_BalanceGeneral');
    return BalanceGeneral.fromMap(res.first);
  }

  static Future<List<VentasPorMetodoPago>> getVentasPorMetodoPago() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.rawQuery('SELECT * FROM View_VentasPorMetodoPago');
    return res.map((e) => VentasPorMetodoPago.fromMap(e)).toList();
  }

  static Future<List<EgresosPorMetodoPago>> getEgresosPorMetodoPago() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.rawQuery('SELECT * FROM View_EgresosPorMetodoPago');
    return res.map((e) => EgresosPorMetodoPago.fromMap(e)).toList();
  }

  static Future<ProductoMasVendido?> getProductoMasVendido() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.rawQuery('SELECT * FROM View_ProductoMasVendido');
    if (res.isEmpty) return null;
    return ProductoMasVendido.fromMap(res.first);
  }

  static Future<List<ProductoMasVendidoPorMes>> getProductosMasVendidosPorMes() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.rawQuery('SELECT * FROM View_ProductosMasVendidosPorMes');
    return res.map((e) => ProductoMasVendidoPorMes.fromMap(e)).toList();
  }

  static Future<List<ProductoMenosVendidoPorMes>> getProductosMenosVendidosPorMes() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.rawQuery('SELECT * FROM View_ProductosMenosVendidosPorMes');
    return res.map((e) => ProductoMenosVendidoPorMes.fromMap(e)).toList();
  }

  static Future<MetodoPagoMasUsado?> getMetodoPagoMasUsado() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.rawQuery('SELECT * FROM View_MetodoPagoMasUsado');
    if (res.isEmpty) return null;
    return MetodoPagoMasUsado.fromMap(res.first);
  }

  static Future<List<StockProducto>> getStockProductos() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.rawQuery('SELECT * FROM View_StockProductos');
    return res.map((e) => StockProducto.fromMap(e)).toList();
  }
}