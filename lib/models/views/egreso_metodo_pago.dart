class EgresosPorMetodoPago {
  final String metodoPago;
  final int cantidadGastos;
  final double total;

  EgresosPorMetodoPago({
    required this.metodoPago,
    required this.cantidadGastos,
    required this.total,
  });

  factory EgresosPorMetodoPago.fromMap(Map<String, dynamic> map) => EgresosPorMetodoPago(
    metodoPago: map['metodo_pago'],
    cantidadGastos: map['cantidad_gastos'],
    total: map['total'],
  );
}
