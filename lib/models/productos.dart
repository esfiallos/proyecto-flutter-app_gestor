class Producto {
  final int? id;
  final String codigo;
  final String nombre;
  final double precio;
  final int stock;
  final double costo;
  final String? descripcion;
  final String? fechaVencimiento;
  final String? imagenSrc;
  final String? metodoPago;
  final int? idCategoria;
  
  // Campos agregados
  final String? hora;
  final String? mes;
  final String? imagen;

  Producto({
    this.id,
    required this.codigo,
    required this.nombre,
    required this.precio,
    required this.stock,
    required this.costo,
    this.descripcion,
    this.fechaVencimiento,
    this.imagenSrc,
    this.metodoPago,
    this.idCategoria,
    this.hora,
    this.mes,
    this.imagen,
  });

  factory Producto.fromMap(Map<String, dynamic> map) => Producto(
    id: map['id_producto'],
    codigo: map['codigo'],
    nombre: map['nombre'],
    precio: map['precio'],
    stock: map['stock'],
    costo: map['costo'],
    descripcion: map['descripcion'],
    fechaVencimiento: map['fecha_vencimiento'],
    imagenSrc: map['imagen_src'],
    metodoPago: map['metodo_pago'],
    idCategoria: map['id_categoria'],
    hora: map['hora'],             // asegurarte que esto venga del query SQL
    mes: map['mes'],               // igual
    imagen: map['imagen'],         // o puedes usar imagenSrc directamente
  );

  Map<String, dynamic> toMap({bool excludeId = false}) {
  final map = <String, dynamic>{
    'codigo': codigo,
    'nombre': nombre,
    'precio': precio,
    'stock': stock,
    'costo': costo,
    'descripcion': descripcion,
    'fecha_vencimiento': fechaVencimiento,
    'imagen_src': imagenSrc,
    'metodo_pago': metodoPago,
    'id_categoria': idCategoria,
  };
  
  if (!excludeId && id != null) {
    map['id_producto'] = id;
  }
  
  return map;
}

}
