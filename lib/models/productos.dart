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
  );

  Map<String, dynamic> toMap() => {
    'id_producto': id,
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
}
