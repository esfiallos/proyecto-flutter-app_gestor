class VentasPorMetodoPago {
  final String metodoPago;
  final int cantidadVentas;
  final double total;

  VentasPorMetodoPago({
    required this.metodoPago,
    required this.cantidadVentas,
    required this.total,
  });

  factory VentasPorMetodoPago.fromMap(Map<String, dynamic> map) => VentasPorMetodoPago(
    metodoPago: map['metodo_pago'],
    cantidadVentas: map['cantidad_ventas'],
    total: map['total'],
  );
}
