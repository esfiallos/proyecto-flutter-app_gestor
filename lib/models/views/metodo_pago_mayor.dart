class MetodoPagoMasUsado {
  final String metodoPago;
  final int totalUsos;

  MetodoPagoMasUsado({
    required this.metodoPago,
    required this.totalUsos,
  });

  factory MetodoPagoMasUsado.fromMap(Map<String, dynamic> map) {
  return MetodoPagoMasUsado(
    metodoPago: map['metodo_pago']?.toString() ?? 'Desconocido',
    totalUsos: map['total_usos'] is int
      ? map['total_usos']
      : int.tryParse(map['total_usos']?.toString() ?? '') ?? 0,
  );
}

}