class MetodoPagoMasUsado {
  final String metodoPago;
  final int totalUsos;

  MetodoPagoMasUsado({
    required this.metodoPago,
    required this.totalUsos,
  });

  factory MetodoPagoMasUsado.fromMap(Map<String, dynamic> map) => MetodoPagoMasUsado(
    metodoPago: map['metodo_pago'],
    totalUsos: map['total_usos'],
  );
}
