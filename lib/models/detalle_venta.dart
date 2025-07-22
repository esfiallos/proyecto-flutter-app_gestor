class DetalleVenta {
  final int? id;
  final int idVenta;
  final int idProducto;
  final int cantidad;

  DetalleVenta({
    this.id,
    required this.idVenta,
    required this.idProducto,
    required this.cantidad,
  });

  factory DetalleVenta.fromMap(Map<String, dynamic> map) => DetalleVenta(
    id: map['id_detalle'],
    idVenta: map['id_venta'],
    idProducto: map['id_producto'],
    cantidad: map['cantidad'],
  );

  Map<String, dynamic> toMap() => {
    'id_detalle': id,
    'id_venta': idVenta,
    'id_producto': idProducto,
    'cantidad': cantidad,
  };

  // Aquí va el copyWith que te falta:
  DetalleVenta copyWith({
    int? id,
    int? idVenta,
    int? idProducto,
    int? cantidad,
  }) {
    return DetalleVenta(
      id: id ?? this.id,
      idVenta: idVenta ?? this.idVenta,
      idProducto: idProducto ?? this.idProducto,
      cantidad: cantidad ?? this.cantidad,
    );
  }
}
