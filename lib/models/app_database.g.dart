// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductosTable extends Productos
    with TableInfo<$ProductosTable, Producto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idProductoMeta = const VerificationMeta(
    'idProducto',
  );
  @override
  late final GeneratedColumn<int> idProducto = GeneratedColumn<int>(
    'id_producto',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precioMeta = const VerificationMeta('precio');
  @override
  late final GeneratedColumn<double> precio = GeneratedColumn<double>(
    'precio',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
    'stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [idProducto, nombre, precio, stock];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'productos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Producto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_producto')) {
      context.handle(
        _idProductoMeta,
        idProducto.isAcceptableOrUnknown(data['id_producto']!, _idProductoMeta),
      );
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('precio')) {
      context.handle(
        _precioMeta,
        precio.isAcceptableOrUnknown(data['precio']!, _precioMeta),
      );
    } else if (isInserting) {
      context.missing(_precioMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
        _stockMeta,
        stock.isAcceptableOrUnknown(data['stock']!, _stockMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idProducto};
  @override
  Producto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Producto(
      idProducto: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_producto'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      precio: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precio'],
      )!,
      stock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock'],
      )!,
    );
  }

  @override
  $ProductosTable createAlias(String alias) {
    return $ProductosTable(attachedDatabase, alias);
  }
}

class Producto extends DataClass implements Insertable<Producto> {
  final int idProducto;
  final String nombre;
  final double precio;
  final int stock;
  const Producto({
    required this.idProducto,
    required this.nombre,
    required this.precio,
    required this.stock,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_producto'] = Variable<int>(idProducto);
    map['nombre'] = Variable<String>(nombre);
    map['precio'] = Variable<double>(precio);
    map['stock'] = Variable<int>(stock);
    return map;
  }

  ProductosCompanion toCompanion(bool nullToAbsent) {
    return ProductosCompanion(
      idProducto: Value(idProducto),
      nombre: Value(nombre),
      precio: Value(precio),
      stock: Value(stock),
    );
  }

  factory Producto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Producto(
      idProducto: serializer.fromJson<int>(json['idProducto']),
      nombre: serializer.fromJson<String>(json['nombre']),
      precio: serializer.fromJson<double>(json['precio']),
      stock: serializer.fromJson<int>(json['stock']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idProducto': serializer.toJson<int>(idProducto),
      'nombre': serializer.toJson<String>(nombre),
      'precio': serializer.toJson<double>(precio),
      'stock': serializer.toJson<int>(stock),
    };
  }

  Producto copyWith({
    int? idProducto,
    String? nombre,
    double? precio,
    int? stock,
  }) => Producto(
    idProducto: idProducto ?? this.idProducto,
    nombre: nombre ?? this.nombre,
    precio: precio ?? this.precio,
    stock: stock ?? this.stock,
  );
  Producto copyWithCompanion(ProductosCompanion data) {
    return Producto(
      idProducto: data.idProducto.present
          ? data.idProducto.value
          : this.idProducto,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      precio: data.precio.present ? data.precio.value : this.precio,
      stock: data.stock.present ? data.stock.value : this.stock,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Producto(')
          ..write('idProducto: $idProducto, ')
          ..write('nombre: $nombre, ')
          ..write('precio: $precio, ')
          ..write('stock: $stock')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idProducto, nombre, precio, stock);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Producto &&
          other.idProducto == this.idProducto &&
          other.nombre == this.nombre &&
          other.precio == this.precio &&
          other.stock == this.stock);
}

class ProductosCompanion extends UpdateCompanion<Producto> {
  final Value<int> idProducto;
  final Value<String> nombre;
  final Value<double> precio;
  final Value<int> stock;
  const ProductosCompanion({
    this.idProducto = const Value.absent(),
    this.nombre = const Value.absent(),
    this.precio = const Value.absent(),
    this.stock = const Value.absent(),
  });
  ProductosCompanion.insert({
    this.idProducto = const Value.absent(),
    required String nombre,
    required double precio,
    this.stock = const Value.absent(),
  }) : nombre = Value(nombre),
       precio = Value(precio);
  static Insertable<Producto> custom({
    Expression<int>? idProducto,
    Expression<String>? nombre,
    Expression<double>? precio,
    Expression<int>? stock,
  }) {
    return RawValuesInsertable({
      if (idProducto != null) 'id_producto': idProducto,
      if (nombre != null) 'nombre': nombre,
      if (precio != null) 'precio': precio,
      if (stock != null) 'stock': stock,
    });
  }

  ProductosCompanion copyWith({
    Value<int>? idProducto,
    Value<String>? nombre,
    Value<double>? precio,
    Value<int>? stock,
  }) {
    return ProductosCompanion(
      idProducto: idProducto ?? this.idProducto,
      nombre: nombre ?? this.nombre,
      precio: precio ?? this.precio,
      stock: stock ?? this.stock,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idProducto.present) {
      map['id_producto'] = Variable<int>(idProducto.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (precio.present) {
      map['precio'] = Variable<double>(precio.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductosCompanion(')
          ..write('idProducto: $idProducto, ')
          ..write('nombre: $nombre, ')
          ..write('precio: $precio, ')
          ..write('stock: $stock')
          ..write(')'))
        .toString();
  }
}

class $VentasTable extends Ventas with TableInfo<$VentasTable, Venta> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VentasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idVentaMeta = const VerificationMeta(
    'idVenta',
  );
  @override
  late final GeneratedColumn<int> idVenta = GeneratedColumn<int>(
    'id_venta',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
    'fecha',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [idVenta, fecha, total];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ventas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Venta> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_venta')) {
      context.handle(
        _idVentaMeta,
        idVenta.isAcceptableOrUnknown(data['id_venta']!, _idVentaMeta),
      );
    }
    if (data.containsKey('fecha')) {
      context.handle(
        _fechaMeta,
        fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta),
      );
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idVenta};
  @override
  Venta map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Venta(
      idVenta: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_venta'],
      )!,
      fecha: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total'],
      )!,
    );
  }

  @override
  $VentasTable createAlias(String alias) {
    return $VentasTable(attachedDatabase, alias);
  }
}

class Venta extends DataClass implements Insertable<Venta> {
  final int idVenta;
  final DateTime fecha;
  final double total;
  const Venta({
    required this.idVenta,
    required this.fecha,
    required this.total,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_venta'] = Variable<int>(idVenta);
    map['fecha'] = Variable<DateTime>(fecha);
    map['total'] = Variable<double>(total);
    return map;
  }

  VentasCompanion toCompanion(bool nullToAbsent) {
    return VentasCompanion(
      idVenta: Value(idVenta),
      fecha: Value(fecha),
      total: Value(total),
    );
  }

  factory Venta.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Venta(
      idVenta: serializer.fromJson<int>(json['idVenta']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
      total: serializer.fromJson<double>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idVenta': serializer.toJson<int>(idVenta),
      'fecha': serializer.toJson<DateTime>(fecha),
      'total': serializer.toJson<double>(total),
    };
  }

  Venta copyWith({int? idVenta, DateTime? fecha, double? total}) => Venta(
    idVenta: idVenta ?? this.idVenta,
    fecha: fecha ?? this.fecha,
    total: total ?? this.total,
  );
  Venta copyWithCompanion(VentasCompanion data) {
    return Venta(
      idVenta: data.idVenta.present ? data.idVenta.value : this.idVenta,
      fecha: data.fecha.present ? data.fecha.value : this.fecha,
      total: data.total.present ? data.total.value : this.total,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Venta(')
          ..write('idVenta: $idVenta, ')
          ..write('fecha: $fecha, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idVenta, fecha, total);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Venta &&
          other.idVenta == this.idVenta &&
          other.fecha == this.fecha &&
          other.total == this.total);
}

class VentasCompanion extends UpdateCompanion<Venta> {
  final Value<int> idVenta;
  final Value<DateTime> fecha;
  final Value<double> total;
  const VentasCompanion({
    this.idVenta = const Value.absent(),
    this.fecha = const Value.absent(),
    this.total = const Value.absent(),
  });
  VentasCompanion.insert({
    this.idVenta = const Value.absent(),
    this.fecha = const Value.absent(),
    required double total,
  }) : total = Value(total);
  static Insertable<Venta> custom({
    Expression<int>? idVenta,
    Expression<DateTime>? fecha,
    Expression<double>? total,
  }) {
    return RawValuesInsertable({
      if (idVenta != null) 'id_venta': idVenta,
      if (fecha != null) 'fecha': fecha,
      if (total != null) 'total': total,
    });
  }

  VentasCompanion copyWith({
    Value<int>? idVenta,
    Value<DateTime>? fecha,
    Value<double>? total,
  }) {
    return VentasCompanion(
      idVenta: idVenta ?? this.idVenta,
      fecha: fecha ?? this.fecha,
      total: total ?? this.total,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idVenta.present) {
      map['id_venta'] = Variable<int>(idVenta.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VentasCompanion(')
          ..write('idVenta: $idVenta, ')
          ..write('fecha: $fecha, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }
}

class $DetalleVentaTable extends DetalleVenta
    with TableInfo<$DetalleVentaTable, DetalleVenta> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DetalleVentaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idDetalleMeta = const VerificationMeta(
    'idDetalle',
  );
  @override
  late final GeneratedColumn<int> idDetalle = GeneratedColumn<int>(
    'id_detalle',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idVentaMeta = const VerificationMeta(
    'idVenta',
  );
  @override
  late final GeneratedColumn<int> idVenta = GeneratedColumn<int>(
    'id_venta',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES ventas(id_venta)',
  );
  static const VerificationMeta _idProductoMeta = const VerificationMeta(
    'idProducto',
  );
  @override
  late final GeneratedColumn<int> idProducto = GeneratedColumn<int>(
    'id_producto',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES productos(id_producto)',
  );
  static const VerificationMeta _cantidadMeta = const VerificationMeta(
    'cantidad',
  );
  @override
  late final GeneratedColumn<int> cantidad = GeneratedColumn<int>(
    'cantidad',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idDetalle,
    idVenta,
    idProducto,
    cantidad,
    subtotal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'detalle_venta';
  @override
  VerificationContext validateIntegrity(
    Insertable<DetalleVenta> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_detalle')) {
      context.handle(
        _idDetalleMeta,
        idDetalle.isAcceptableOrUnknown(data['id_detalle']!, _idDetalleMeta),
      );
    }
    if (data.containsKey('id_venta')) {
      context.handle(
        _idVentaMeta,
        idVenta.isAcceptableOrUnknown(data['id_venta']!, _idVentaMeta),
      );
    } else if (isInserting) {
      context.missing(_idVentaMeta);
    }
    if (data.containsKey('id_producto')) {
      context.handle(
        _idProductoMeta,
        idProducto.isAcceptableOrUnknown(data['id_producto']!, _idProductoMeta),
      );
    } else if (isInserting) {
      context.missing(_idProductoMeta);
    }
    if (data.containsKey('cantidad')) {
      context.handle(
        _cantidadMeta,
        cantidad.isAcceptableOrUnknown(data['cantidad']!, _cantidadMeta),
      );
    } else if (isInserting) {
      context.missing(_cantidadMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idDetalle};
  @override
  DetalleVenta map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DetalleVenta(
      idDetalle: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_detalle'],
      )!,
      idVenta: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_venta'],
      )!,
      idProducto: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_producto'],
      )!,
      cantidad: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cantidad'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
    );
  }

  @override
  $DetalleVentaTable createAlias(String alias) {
    return $DetalleVentaTable(attachedDatabase, alias);
  }
}

class DetalleVenta extends DataClass implements Insertable<DetalleVenta> {
  final int idDetalle;
  final int idVenta;
  final int idProducto;
  final int cantidad;
  final double subtotal;
  const DetalleVenta({
    required this.idDetalle,
    required this.idVenta,
    required this.idProducto,
    required this.cantidad,
    required this.subtotal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_detalle'] = Variable<int>(idDetalle);
    map['id_venta'] = Variable<int>(idVenta);
    map['id_producto'] = Variable<int>(idProducto);
    map['cantidad'] = Variable<int>(cantidad);
    map['subtotal'] = Variable<double>(subtotal);
    return map;
  }

  DetalleVentaCompanion toCompanion(bool nullToAbsent) {
    return DetalleVentaCompanion(
      idDetalle: Value(idDetalle),
      idVenta: Value(idVenta),
      idProducto: Value(idProducto),
      cantidad: Value(cantidad),
      subtotal: Value(subtotal),
    );
  }

  factory DetalleVenta.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DetalleVenta(
      idDetalle: serializer.fromJson<int>(json['idDetalle']),
      idVenta: serializer.fromJson<int>(json['idVenta']),
      idProducto: serializer.fromJson<int>(json['idProducto']),
      cantidad: serializer.fromJson<int>(json['cantidad']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idDetalle': serializer.toJson<int>(idDetalle),
      'idVenta': serializer.toJson<int>(idVenta),
      'idProducto': serializer.toJson<int>(idProducto),
      'cantidad': serializer.toJson<int>(cantidad),
      'subtotal': serializer.toJson<double>(subtotal),
    };
  }

  DetalleVenta copyWith({
    int? idDetalle,
    int? idVenta,
    int? idProducto,
    int? cantidad,
    double? subtotal,
  }) => DetalleVenta(
    idDetalle: idDetalle ?? this.idDetalle,
    idVenta: idVenta ?? this.idVenta,
    idProducto: idProducto ?? this.idProducto,
    cantidad: cantidad ?? this.cantidad,
    subtotal: subtotal ?? this.subtotal,
  );
  DetalleVenta copyWithCompanion(DetalleVentaCompanion data) {
    return DetalleVenta(
      idDetalle: data.idDetalle.present ? data.idDetalle.value : this.idDetalle,
      idVenta: data.idVenta.present ? data.idVenta.value : this.idVenta,
      idProducto: data.idProducto.present
          ? data.idProducto.value
          : this.idProducto,
      cantidad: data.cantidad.present ? data.cantidad.value : this.cantidad,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DetalleVenta(')
          ..write('idDetalle: $idDetalle, ')
          ..write('idVenta: $idVenta, ')
          ..write('idProducto: $idProducto, ')
          ..write('cantidad: $cantidad, ')
          ..write('subtotal: $subtotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idDetalle, idVenta, idProducto, cantidad, subtotal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetalleVenta &&
          other.idDetalle == this.idDetalle &&
          other.idVenta == this.idVenta &&
          other.idProducto == this.idProducto &&
          other.cantidad == this.cantidad &&
          other.subtotal == this.subtotal);
}

class DetalleVentaCompanion extends UpdateCompanion<DetalleVenta> {
  final Value<int> idDetalle;
  final Value<int> idVenta;
  final Value<int> idProducto;
  final Value<int> cantidad;
  final Value<double> subtotal;
  const DetalleVentaCompanion({
    this.idDetalle = const Value.absent(),
    this.idVenta = const Value.absent(),
    this.idProducto = const Value.absent(),
    this.cantidad = const Value.absent(),
    this.subtotal = const Value.absent(),
  });
  DetalleVentaCompanion.insert({
    this.idDetalle = const Value.absent(),
    required int idVenta,
    required int idProducto,
    required int cantidad,
    required double subtotal,
  }) : idVenta = Value(idVenta),
       idProducto = Value(idProducto),
       cantidad = Value(cantidad),
       subtotal = Value(subtotal);
  static Insertable<DetalleVenta> custom({
    Expression<int>? idDetalle,
    Expression<int>? idVenta,
    Expression<int>? idProducto,
    Expression<int>? cantidad,
    Expression<double>? subtotal,
  }) {
    return RawValuesInsertable({
      if (idDetalle != null) 'id_detalle': idDetalle,
      if (idVenta != null) 'id_venta': idVenta,
      if (idProducto != null) 'id_producto': idProducto,
      if (cantidad != null) 'cantidad': cantidad,
      if (subtotal != null) 'subtotal': subtotal,
    });
  }

  DetalleVentaCompanion copyWith({
    Value<int>? idDetalle,
    Value<int>? idVenta,
    Value<int>? idProducto,
    Value<int>? cantidad,
    Value<double>? subtotal,
  }) {
    return DetalleVentaCompanion(
      idDetalle: idDetalle ?? this.idDetalle,
      idVenta: idVenta ?? this.idVenta,
      idProducto: idProducto ?? this.idProducto,
      cantidad: cantidad ?? this.cantidad,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idDetalle.present) {
      map['id_detalle'] = Variable<int>(idDetalle.value);
    }
    if (idVenta.present) {
      map['id_venta'] = Variable<int>(idVenta.value);
    }
    if (idProducto.present) {
      map['id_producto'] = Variable<int>(idProducto.value);
    }
    if (cantidad.present) {
      map['cantidad'] = Variable<int>(cantidad.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetalleVentaCompanion(')
          ..write('idDetalle: $idDetalle, ')
          ..write('idVenta: $idVenta, ')
          ..write('idProducto: $idProducto, ')
          ..write('cantidad: $cantidad, ')
          ..write('subtotal: $subtotal')
          ..write(')'))
        .toString();
  }
}

class $GastosTable extends Gastos with TableInfo<$GastosTable, Gasto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GastosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idGastoMeta = const VerificationMeta(
    'idGasto',
  );
  @override
  late final GeneratedColumn<int> idGasto = GeneratedColumn<int>(
    'id_gasto',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _montoMeta = const VerificationMeta('monto');
  @override
  late final GeneratedColumn<double> monto = GeneratedColumn<double>(
    'monto',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoriaMeta = const VerificationMeta(
    'categoria',
  );
  @override
  late final GeneratedColumn<String> categoria = GeneratedColumn<String>(
    'categoria',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
    'fecha',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idGasto,
    descripcion,
    monto,
    categoria,
    fecha,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gastos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Gasto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_gasto')) {
      context.handle(
        _idGastoMeta,
        idGasto.isAcceptableOrUnknown(data['id_gasto']!, _idGastoMeta),
      );
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('monto')) {
      context.handle(
        _montoMeta,
        monto.isAcceptableOrUnknown(data['monto']!, _montoMeta),
      );
    } else if (isInserting) {
      context.missing(_montoMeta);
    }
    if (data.containsKey('categoria')) {
      context.handle(
        _categoriaMeta,
        categoria.isAcceptableOrUnknown(data['categoria']!, _categoriaMeta),
      );
    }
    if (data.containsKey('fecha')) {
      context.handle(
        _fechaMeta,
        fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idGasto};
  @override
  Gasto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Gasto(
      idGasto: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_gasto'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      monto: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}monto'],
      )!,
      categoria: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categoria'],
      ),
      fecha: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha'],
      )!,
    );
  }

  @override
  $GastosTable createAlias(String alias) {
    return $GastosTable(attachedDatabase, alias);
  }
}

class Gasto extends DataClass implements Insertable<Gasto> {
  final int idGasto;
  final String descripcion;
  final double monto;
  final String? categoria;
  final DateTime fecha;
  const Gasto({
    required this.idGasto,
    required this.descripcion,
    required this.monto,
    this.categoria,
    required this.fecha,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_gasto'] = Variable<int>(idGasto);
    map['descripcion'] = Variable<String>(descripcion);
    map['monto'] = Variable<double>(monto);
    if (!nullToAbsent || categoria != null) {
      map['categoria'] = Variable<String>(categoria);
    }
    map['fecha'] = Variable<DateTime>(fecha);
    return map;
  }

  GastosCompanion toCompanion(bool nullToAbsent) {
    return GastosCompanion(
      idGasto: Value(idGasto),
      descripcion: Value(descripcion),
      monto: Value(monto),
      categoria: categoria == null && nullToAbsent
          ? const Value.absent()
          : Value(categoria),
      fecha: Value(fecha),
    );
  }

  factory Gasto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Gasto(
      idGasto: serializer.fromJson<int>(json['idGasto']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      monto: serializer.fromJson<double>(json['monto']),
      categoria: serializer.fromJson<String?>(json['categoria']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idGasto': serializer.toJson<int>(idGasto),
      'descripcion': serializer.toJson<String>(descripcion),
      'monto': serializer.toJson<double>(monto),
      'categoria': serializer.toJson<String?>(categoria),
      'fecha': serializer.toJson<DateTime>(fecha),
    };
  }

  Gasto copyWith({
    int? idGasto,
    String? descripcion,
    double? monto,
    Value<String?> categoria = const Value.absent(),
    DateTime? fecha,
  }) => Gasto(
    idGasto: idGasto ?? this.idGasto,
    descripcion: descripcion ?? this.descripcion,
    monto: monto ?? this.monto,
    categoria: categoria.present ? categoria.value : this.categoria,
    fecha: fecha ?? this.fecha,
  );
  Gasto copyWithCompanion(GastosCompanion data) {
    return Gasto(
      idGasto: data.idGasto.present ? data.idGasto.value : this.idGasto,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      monto: data.monto.present ? data.monto.value : this.monto,
      categoria: data.categoria.present ? data.categoria.value : this.categoria,
      fecha: data.fecha.present ? data.fecha.value : this.fecha,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Gasto(')
          ..write('idGasto: $idGasto, ')
          ..write('descripcion: $descripcion, ')
          ..write('monto: $monto, ')
          ..write('categoria: $categoria, ')
          ..write('fecha: $fecha')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idGasto, descripcion, monto, categoria, fecha);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Gasto &&
          other.idGasto == this.idGasto &&
          other.descripcion == this.descripcion &&
          other.monto == this.monto &&
          other.categoria == this.categoria &&
          other.fecha == this.fecha);
}

class GastosCompanion extends UpdateCompanion<Gasto> {
  final Value<int> idGasto;
  final Value<String> descripcion;
  final Value<double> monto;
  final Value<String?> categoria;
  final Value<DateTime> fecha;
  const GastosCompanion({
    this.idGasto = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.monto = const Value.absent(),
    this.categoria = const Value.absent(),
    this.fecha = const Value.absent(),
  });
  GastosCompanion.insert({
    this.idGasto = const Value.absent(),
    required String descripcion,
    required double monto,
    this.categoria = const Value.absent(),
    this.fecha = const Value.absent(),
  }) : descripcion = Value(descripcion),
       monto = Value(monto);
  static Insertable<Gasto> custom({
    Expression<int>? idGasto,
    Expression<String>? descripcion,
    Expression<double>? monto,
    Expression<String>? categoria,
    Expression<DateTime>? fecha,
  }) {
    return RawValuesInsertable({
      if (idGasto != null) 'id_gasto': idGasto,
      if (descripcion != null) 'descripcion': descripcion,
      if (monto != null) 'monto': monto,
      if (categoria != null) 'categoria': categoria,
      if (fecha != null) 'fecha': fecha,
    });
  }

  GastosCompanion copyWith({
    Value<int>? idGasto,
    Value<String>? descripcion,
    Value<double>? monto,
    Value<String?>? categoria,
    Value<DateTime>? fecha,
  }) {
    return GastosCompanion(
      idGasto: idGasto ?? this.idGasto,
      descripcion: descripcion ?? this.descripcion,
      monto: monto ?? this.monto,
      categoria: categoria ?? this.categoria,
      fecha: fecha ?? this.fecha,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idGasto.present) {
      map['id_gasto'] = Variable<int>(idGasto.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (monto.present) {
      map['monto'] = Variable<double>(monto.value);
    }
    if (categoria.present) {
      map['categoria'] = Variable<String>(categoria.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GastosCompanion(')
          ..write('idGasto: $idGasto, ')
          ..write('descripcion: $descripcion, ')
          ..write('monto: $monto, ')
          ..write('categoria: $categoria, ')
          ..write('fecha: $fecha')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductosTable productos = $ProductosTable(this);
  late final $VentasTable ventas = $VentasTable(this);
  late final $DetalleVentaTable detalleVenta = $DetalleVentaTable(this);
  late final $GastosTable gastos = $GastosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    productos,
    ventas,
    detalleVenta,
    gastos,
  ];
}

typedef $$ProductosTableCreateCompanionBuilder =
    ProductosCompanion Function({
      Value<int> idProducto,
      required String nombre,
      required double precio,
      Value<int> stock,
    });
typedef $$ProductosTableUpdateCompanionBuilder =
    ProductosCompanion Function({
      Value<int> idProducto,
      Value<String> nombre,
      Value<double> precio,
      Value<int> stock,
    });

final class $$ProductosTableReferences
    extends BaseReferences<_$AppDatabase, $ProductosTable, Producto> {
  $$ProductosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DetalleVentaTable, List<DetalleVenta>>
  _detalleVentaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.detalleVenta,
    aliasName: $_aliasNameGenerator(
      db.productos.idProducto,
      db.detalleVenta.idProducto,
    ),
  );

  $$DetalleVentaTableProcessedTableManager get detalleVentaRefs {
    final manager = $$DetalleVentaTableTableManager($_db, $_db.detalleVenta)
        .filter(
          (f) => f.idProducto.idProducto.sqlEquals(
            $_itemColumn<int>('id_producto')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_detalleVentaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductosTableFilterComposer
    extends Composer<_$AppDatabase, $ProductosTable> {
  $$ProductosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idProducto => $composableBuilder(
    column: $table.idProducto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precio => $composableBuilder(
    column: $table.precio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> detalleVentaRefs(
    Expression<bool> Function($$DetalleVentaTableFilterComposer f) f,
  ) {
    final $$DetalleVentaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.detalleVenta,
      getReferencedColumn: (t) => t.idProducto,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetalleVentaTableFilterComposer(
            $db: $db,
            $table: $db.detalleVenta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductosTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductosTable> {
  $$ProductosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idProducto => $composableBuilder(
    column: $table.idProducto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precio => $composableBuilder(
    column: $table.precio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductosTable> {
  $$ProductosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idProducto => $composableBuilder(
    column: $table.idProducto,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<double> get precio =>
      $composableBuilder(column: $table.precio, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  Expression<T> detalleVentaRefs<T extends Object>(
    Expression<T> Function($$DetalleVentaTableAnnotationComposer a) f,
  ) {
    final $$DetalleVentaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.detalleVenta,
      getReferencedColumn: (t) => t.idProducto,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetalleVentaTableAnnotationComposer(
            $db: $db,
            $table: $db.detalleVenta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductosTable,
          Producto,
          $$ProductosTableFilterComposer,
          $$ProductosTableOrderingComposer,
          $$ProductosTableAnnotationComposer,
          $$ProductosTableCreateCompanionBuilder,
          $$ProductosTableUpdateCompanionBuilder,
          (Producto, $$ProductosTableReferences),
          Producto,
          PrefetchHooks Function({bool detalleVentaRefs})
        > {
  $$ProductosTableTableManager(_$AppDatabase db, $ProductosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idProducto = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<double> precio = const Value.absent(),
                Value<int> stock = const Value.absent(),
              }) => ProductosCompanion(
                idProducto: idProducto,
                nombre: nombre,
                precio: precio,
                stock: stock,
              ),
          createCompanionCallback:
              ({
                Value<int> idProducto = const Value.absent(),
                required String nombre,
                required double precio,
                Value<int> stock = const Value.absent(),
              }) => ProductosCompanion.insert(
                idProducto: idProducto,
                nombre: nombre,
                precio: precio,
                stock: stock,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({detalleVentaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (detalleVentaRefs) db.detalleVenta],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (detalleVentaRefs)
                    await $_getPrefetchedData<
                      Producto,
                      $ProductosTable,
                      DetalleVenta
                    >(
                      currentTable: table,
                      referencedTable: $$ProductosTableReferences
                          ._detalleVentaRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProductosTableReferences(
                            db,
                            table,
                            p0,
                          ).detalleVentaRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idProducto == item.idProducto,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProductosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductosTable,
      Producto,
      $$ProductosTableFilterComposer,
      $$ProductosTableOrderingComposer,
      $$ProductosTableAnnotationComposer,
      $$ProductosTableCreateCompanionBuilder,
      $$ProductosTableUpdateCompanionBuilder,
      (Producto, $$ProductosTableReferences),
      Producto,
      PrefetchHooks Function({bool detalleVentaRefs})
    >;
typedef $$VentasTableCreateCompanionBuilder =
    VentasCompanion Function({
      Value<int> idVenta,
      Value<DateTime> fecha,
      required double total,
    });
typedef $$VentasTableUpdateCompanionBuilder =
    VentasCompanion Function({
      Value<int> idVenta,
      Value<DateTime> fecha,
      Value<double> total,
    });

final class $$VentasTableReferences
    extends BaseReferences<_$AppDatabase, $VentasTable, Venta> {
  $$VentasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DetalleVentaTable, List<DetalleVenta>>
  _detalleVentaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.detalleVenta,
    aliasName: $_aliasNameGenerator(db.ventas.idVenta, db.detalleVenta.idVenta),
  );

  $$DetalleVentaTableProcessedTableManager get detalleVentaRefs {
    final manager = $$DetalleVentaTableTableManager($_db, $_db.detalleVenta)
        .filter(
          (f) => f.idVenta.idVenta.sqlEquals($_itemColumn<int>('id_venta')!),
        );

    final cache = $_typedResult.readTableOrNull(_detalleVentaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VentasTableFilterComposer
    extends Composer<_$AppDatabase, $VentasTable> {
  $$VentasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idVenta => $composableBuilder(
    column: $table.idVenta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> detalleVentaRefs(
    Expression<bool> Function($$DetalleVentaTableFilterComposer f) f,
  ) {
    final $$DetalleVentaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVenta,
      referencedTable: $db.detalleVenta,
      getReferencedColumn: (t) => t.idVenta,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetalleVentaTableFilterComposer(
            $db: $db,
            $table: $db.detalleVenta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VentasTableOrderingComposer
    extends Composer<_$AppDatabase, $VentasTable> {
  $$VentasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idVenta => $composableBuilder(
    column: $table.idVenta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VentasTableAnnotationComposer
    extends Composer<_$AppDatabase, $VentasTable> {
  $$VentasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idVenta =>
      $composableBuilder(column: $table.idVenta, builder: (column) => column);

  GeneratedColumn<DateTime> get fecha =>
      $composableBuilder(column: $table.fecha, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  Expression<T> detalleVentaRefs<T extends Object>(
    Expression<T> Function($$DetalleVentaTableAnnotationComposer a) f,
  ) {
    final $$DetalleVentaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVenta,
      referencedTable: $db.detalleVenta,
      getReferencedColumn: (t) => t.idVenta,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetalleVentaTableAnnotationComposer(
            $db: $db,
            $table: $db.detalleVenta,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VentasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VentasTable,
          Venta,
          $$VentasTableFilterComposer,
          $$VentasTableOrderingComposer,
          $$VentasTableAnnotationComposer,
          $$VentasTableCreateCompanionBuilder,
          $$VentasTableUpdateCompanionBuilder,
          (Venta, $$VentasTableReferences),
          Venta,
          PrefetchHooks Function({bool detalleVentaRefs})
        > {
  $$VentasTableTableManager(_$AppDatabase db, $VentasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VentasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VentasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VentasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idVenta = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
                Value<double> total = const Value.absent(),
              }) =>
                  VentasCompanion(idVenta: idVenta, fecha: fecha, total: total),
          createCompanionCallback:
              ({
                Value<int> idVenta = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
                required double total,
              }) => VentasCompanion.insert(
                idVenta: idVenta,
                fecha: fecha,
                total: total,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$VentasTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({detalleVentaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (detalleVentaRefs) db.detalleVenta],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (detalleVentaRefs)
                    await $_getPrefetchedData<
                      Venta,
                      $VentasTable,
                      DetalleVenta
                    >(
                      currentTable: table,
                      referencedTable: $$VentasTableReferences
                          ._detalleVentaRefsTable(db),
                      managerFromTypedResult: (p0) => $$VentasTableReferences(
                        db,
                        table,
                        p0,
                      ).detalleVentaRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idVenta == item.idVenta,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$VentasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VentasTable,
      Venta,
      $$VentasTableFilterComposer,
      $$VentasTableOrderingComposer,
      $$VentasTableAnnotationComposer,
      $$VentasTableCreateCompanionBuilder,
      $$VentasTableUpdateCompanionBuilder,
      (Venta, $$VentasTableReferences),
      Venta,
      PrefetchHooks Function({bool detalleVentaRefs})
    >;
typedef $$DetalleVentaTableCreateCompanionBuilder =
    DetalleVentaCompanion Function({
      Value<int> idDetalle,
      required int idVenta,
      required int idProducto,
      required int cantidad,
      required double subtotal,
    });
typedef $$DetalleVentaTableUpdateCompanionBuilder =
    DetalleVentaCompanion Function({
      Value<int> idDetalle,
      Value<int> idVenta,
      Value<int> idProducto,
      Value<int> cantidad,
      Value<double> subtotal,
    });

final class $$DetalleVentaTableReferences
    extends BaseReferences<_$AppDatabase, $DetalleVentaTable, DetalleVenta> {
  $$DetalleVentaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VentasTable _idVentaTable(_$AppDatabase db) => db.ventas.createAlias(
    $_aliasNameGenerator(db.detalleVenta.idVenta, db.ventas.idVenta),
  );

  $$VentasTableProcessedTableManager get idVenta {
    final $_column = $_itemColumn<int>('id_venta')!;

    final manager = $$VentasTableTableManager(
      $_db,
      $_db.ventas,
    ).filter((f) => f.idVenta.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idVentaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductosTable _idProductoTable(_$AppDatabase db) =>
      db.productos.createAlias(
        $_aliasNameGenerator(
          db.detalleVenta.idProducto,
          db.productos.idProducto,
        ),
      );

  $$ProductosTableProcessedTableManager get idProducto {
    final $_column = $_itemColumn<int>('id_producto')!;

    final manager = $$ProductosTableTableManager(
      $_db,
      $_db.productos,
    ).filter((f) => f.idProducto.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idProductoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DetalleVentaTableFilterComposer
    extends Composer<_$AppDatabase, $DetalleVentaTable> {
  $$DetalleVentaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idDetalle => $composableBuilder(
    column: $table.idDetalle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cantidad => $composableBuilder(
    column: $table.cantidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  $$VentasTableFilterComposer get idVenta {
    final $$VentasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVenta,
      referencedTable: $db.ventas,
      getReferencedColumn: (t) => t.idVenta,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VentasTableFilterComposer(
            $db: $db,
            $table: $db.ventas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductosTableFilterComposer get idProducto {
    final $$ProductosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.idProducto,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableFilterComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DetalleVentaTableOrderingComposer
    extends Composer<_$AppDatabase, $DetalleVentaTable> {
  $$DetalleVentaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idDetalle => $composableBuilder(
    column: $table.idDetalle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cantidad => $composableBuilder(
    column: $table.cantidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  $$VentasTableOrderingComposer get idVenta {
    final $$VentasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVenta,
      referencedTable: $db.ventas,
      getReferencedColumn: (t) => t.idVenta,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VentasTableOrderingComposer(
            $db: $db,
            $table: $db.ventas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductosTableOrderingComposer get idProducto {
    final $$ProductosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.idProducto,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableOrderingComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DetalleVentaTableAnnotationComposer
    extends Composer<_$AppDatabase, $DetalleVentaTable> {
  $$DetalleVentaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idDetalle =>
      $composableBuilder(column: $table.idDetalle, builder: (column) => column);

  GeneratedColumn<int> get cantidad =>
      $composableBuilder(column: $table.cantidad, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  $$VentasTableAnnotationComposer get idVenta {
    final $$VentasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVenta,
      referencedTable: $db.ventas,
      getReferencedColumn: (t) => t.idVenta,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VentasTableAnnotationComposer(
            $db: $db,
            $table: $db.ventas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductosTableAnnotationComposer get idProducto {
    final $$ProductosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.idProducto,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableAnnotationComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DetalleVentaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DetalleVentaTable,
          DetalleVenta,
          $$DetalleVentaTableFilterComposer,
          $$DetalleVentaTableOrderingComposer,
          $$DetalleVentaTableAnnotationComposer,
          $$DetalleVentaTableCreateCompanionBuilder,
          $$DetalleVentaTableUpdateCompanionBuilder,
          (DetalleVenta, $$DetalleVentaTableReferences),
          DetalleVenta,
          PrefetchHooks Function({bool idVenta, bool idProducto})
        > {
  $$DetalleVentaTableTableManager(_$AppDatabase db, $DetalleVentaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DetalleVentaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DetalleVentaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DetalleVentaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idDetalle = const Value.absent(),
                Value<int> idVenta = const Value.absent(),
                Value<int> idProducto = const Value.absent(),
                Value<int> cantidad = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
              }) => DetalleVentaCompanion(
                idDetalle: idDetalle,
                idVenta: idVenta,
                idProducto: idProducto,
                cantidad: cantidad,
                subtotal: subtotal,
              ),
          createCompanionCallback:
              ({
                Value<int> idDetalle = const Value.absent(),
                required int idVenta,
                required int idProducto,
                required int cantidad,
                required double subtotal,
              }) => DetalleVentaCompanion.insert(
                idDetalle: idDetalle,
                idVenta: idVenta,
                idProducto: idProducto,
                cantidad: cantidad,
                subtotal: subtotal,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DetalleVentaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idVenta = false, idProducto = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idVenta) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idVenta,
                                referencedTable: $$DetalleVentaTableReferences
                                    ._idVentaTable(db),
                                referencedColumn: $$DetalleVentaTableReferences
                                    ._idVentaTable(db)
                                    .idVenta,
                              )
                              as T;
                    }
                    if (idProducto) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idProducto,
                                referencedTable: $$DetalleVentaTableReferences
                                    ._idProductoTable(db),
                                referencedColumn: $$DetalleVentaTableReferences
                                    ._idProductoTable(db)
                                    .idProducto,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DetalleVentaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DetalleVentaTable,
      DetalleVenta,
      $$DetalleVentaTableFilterComposer,
      $$DetalleVentaTableOrderingComposer,
      $$DetalleVentaTableAnnotationComposer,
      $$DetalleVentaTableCreateCompanionBuilder,
      $$DetalleVentaTableUpdateCompanionBuilder,
      (DetalleVenta, $$DetalleVentaTableReferences),
      DetalleVenta,
      PrefetchHooks Function({bool idVenta, bool idProducto})
    >;
typedef $$GastosTableCreateCompanionBuilder =
    GastosCompanion Function({
      Value<int> idGasto,
      required String descripcion,
      required double monto,
      Value<String?> categoria,
      Value<DateTime> fecha,
    });
typedef $$GastosTableUpdateCompanionBuilder =
    GastosCompanion Function({
      Value<int> idGasto,
      Value<String> descripcion,
      Value<double> monto,
      Value<String?> categoria,
      Value<DateTime> fecha,
    });

class $$GastosTableFilterComposer
    extends Composer<_$AppDatabase, $GastosTable> {
  $$GastosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idGasto => $composableBuilder(
    column: $table.idGasto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get monto => $composableBuilder(
    column: $table.monto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GastosTableOrderingComposer
    extends Composer<_$AppDatabase, $GastosTable> {
  $$GastosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idGasto => $composableBuilder(
    column: $table.idGasto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get monto => $composableBuilder(
    column: $table.monto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GastosTableAnnotationComposer
    extends Composer<_$AppDatabase, $GastosTable> {
  $$GastosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idGasto =>
      $composableBuilder(column: $table.idGasto, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<double> get monto =>
      $composableBuilder(column: $table.monto, builder: (column) => column);

  GeneratedColumn<String> get categoria =>
      $composableBuilder(column: $table.categoria, builder: (column) => column);

  GeneratedColumn<DateTime> get fecha =>
      $composableBuilder(column: $table.fecha, builder: (column) => column);
}

class $$GastosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GastosTable,
          Gasto,
          $$GastosTableFilterComposer,
          $$GastosTableOrderingComposer,
          $$GastosTableAnnotationComposer,
          $$GastosTableCreateCompanionBuilder,
          $$GastosTableUpdateCompanionBuilder,
          (Gasto, BaseReferences<_$AppDatabase, $GastosTable, Gasto>),
          Gasto,
          PrefetchHooks Function()
        > {
  $$GastosTableTableManager(_$AppDatabase db, $GastosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GastosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GastosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GastosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idGasto = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<double> monto = const Value.absent(),
                Value<String?> categoria = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
              }) => GastosCompanion(
                idGasto: idGasto,
                descripcion: descripcion,
                monto: monto,
                categoria: categoria,
                fecha: fecha,
              ),
          createCompanionCallback:
              ({
                Value<int> idGasto = const Value.absent(),
                required String descripcion,
                required double monto,
                Value<String?> categoria = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
              }) => GastosCompanion.insert(
                idGasto: idGasto,
                descripcion: descripcion,
                monto: monto,
                categoria: categoria,
                fecha: fecha,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GastosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GastosTable,
      Gasto,
      $$GastosTableFilterComposer,
      $$GastosTableOrderingComposer,
      $$GastosTableAnnotationComposer,
      $$GastosTableCreateCompanionBuilder,
      $$GastosTableUpdateCompanionBuilder,
      (Gasto, BaseReferences<_$AppDatabase, $GastosTable, Gasto>),
      Gasto,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductosTableTableManager get productos =>
      $$ProductosTableTableManager(_db, _db.productos);
  $$VentasTableTableManager get ventas =>
      $$VentasTableTableManager(_db, _db.ventas);
  $$DetalleVentaTableTableManager get detalleVenta =>
      $$DetalleVentaTableTableManager(_db, _db.detalleVenta);
  $$GastosTableTableManager get gastos =>
      $$GastosTableTableManager(_db, _db.gastos);
}
