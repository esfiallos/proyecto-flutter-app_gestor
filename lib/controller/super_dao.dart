import 'package:miki/models/categoria.dart';
import 'package:miki/models/detalle_venta.dart';
import 'package:miki/models/gasto.dart';
import 'package:miki/models/productos.dart';
import 'package:miki/models/usuario.dart';
import 'package:miki/models/venta.dart';
import 'package:miki/bd/databasehelper.dart';


class UsuarioDAO {
  static Future<int> insert(Usuario usuario) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('Usuarios', usuario.toMap());
  }

  static Future<List<Usuario>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.query('Usuarios');
    return res.map((e) => Usuario.fromMap(e)).toList();
  }

  static Future<Usuario?> getById(int id) async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.query('Usuarios', where: 'id_usuario = ?', whereArgs: [id]);
    return res.isNotEmpty ? Usuario.fromMap(res.first) : null;
  }

  static Future<int> update(Usuario usuario) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update('Usuarios', usuario.toMap(), where: 'id_usuario = ?', whereArgs: [usuario.id]);
  }

  static Future<int> delete(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete('Usuarios', where: 'id_usuario = ?', whereArgs: [id]);
  }
}

class CategoriaDAO {
  static Future<int> insert(Categoria cat) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('Categorias', cat.toMap());
  }

  static Future<List<Categoria>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.query('Categorias');
    return res.map((e) => Categoria.fromMap(e)).toList();
  }

  static Future<Categoria?> getById(int id) async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.query('Categorias', where: 'id_categoria = ?', whereArgs: [id]);
    return res.isNotEmpty ? Categoria.fromMap(res.first) : null;
  }
}

class ProductoDAO {
  static Future<int> insert(Producto p) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('Productos', p.toMap());
  }

  static Future<List<Producto>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.query('Productos');
    return res.map((e) => Producto.fromMap(e)).toList();
  }

  static Future<Producto?> getById(String codigo) async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.query('Productos', where: 'codigo = ?', whereArgs: [codigo]);
    return res.isNotEmpty ? Producto.fromMap(res.first) : null;
  }

  static Future<int> update(Producto p) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update('Productos', p.toMap(), where: 'codigo = ?', whereArgs: [p.codigo]);
  }

  static Future<int> delete(String codigo) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete('Productos', where: 'codigo = ?', whereArgs: [codigo]);
  }
}

class VentaDAO {
  static Future<int> insert(Venta v) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('Ventas', v.toMap());
  }

  static Future<List<Venta>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.query('Ventas');
    return res.map((e) => Venta.fromMap(e)).toList();
  }

  static Future<Venta?> getById(int id) async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.query('Ventas', where: 'id_venta = ?', whereArgs: [id]);
    return res.isNotEmpty ? Venta.fromMap(res.first) : null;
  }
}

class DetalleVentaDAO {
  static Future<int> insert(DetalleVenta dv) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('DetalleVenta', dv.toMap());
  }

  static Future<List<DetalleVenta>> getByVentaId(int idVenta) async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.query('DetalleVenta', where: 'id_venta = ?', whereArgs: [idVenta]);
    return res.map((e) => DetalleVenta.fromMap(e)).toList();
  }
}

class GastoDAO {
  static Future<int> insert(Gasto gasto) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('Gastos', gasto.toMap());
  }

  static Future<List<Gasto>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.query('Gastos');
    return res.map((e) => Gasto.fromMap(e)).toList();
  }

  static Future<List<Gasto>> getPorMetodo(String metodoPago) async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.query('Gastos', where: 'metodo_pago = ?', whereArgs: [metodoPago]);
    return res.map((e) => Gasto.fromMap(e)).toList();
  }
}
