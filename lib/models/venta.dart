class Venta {
  final int? id;
  final String tipoVenta; // 'libre' o 'productos'
  final String? fecha;
  final String? concepto;
  final String? metodoPago;

  Venta({
    this.id,
    required this.tipoVenta,
    this.fecha,
    this.concepto,
    this.metodoPago,
  });

  factory Venta.fromMap(Map<String, dynamic> map) => Venta(
    id: map['id_venta'],
    tipoVenta: map['tipo_venta'],
    fecha: map['fecha'],
    concepto: map['concepto'],
    metodoPago: map['metodo_pago'],
  );

  Map<String, dynamic> toMap() => {
    'id_venta': id,
    'tipo_venta': tipoVenta,
    'fecha': fecha,
    'concepto': concepto,
    'metodo_pago': metodoPago,
  };
}
