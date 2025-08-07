class Gasto {
  final int? id;
  final String? fecha;
  final double valor;
  final String metodoPago;
  final String concepto;
  final int? idProducto;
  final int? cantidad;

  Gasto({
    this.id,
    this.fecha,
    required this.valor,
    required this.metodoPago,
    required this.concepto,
    this.idProducto,
    this.cantidad,
  });

  factory Gasto.fromMap(Map<String, dynamic> map) => Gasto(
    id: map['id_gasto'],
    fecha: map['fecha'],
    valor: map['valor'],
    metodoPago: map['metodo_pago'],
    concepto: map['concepto'],
    idProducto: map['id_producto'],
    cantidad: map['cantidad'],
  );

  Map<String, dynamic> toMap() => {
    'id_gasto': id,
    'fecha': fecha,
    'valor': valor,
    'metodo_pago': metodoPago,
    'concepto': concepto,
    'id_producto': idProducto,
    'cantidad': cantidad,
  };
}
