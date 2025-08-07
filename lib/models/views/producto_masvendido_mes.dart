class ProductoMasVendidoPorMes {
  final String mes;
  final String nombre;
  final int cantidadTotal;

  ProductoMasVendidoPorMes({
    required this.mes,
    required this.nombre,
    required this.cantidadTotal,
  });

  factory ProductoMasVendidoPorMes.fromMap(Map<String, dynamic> map) => ProductoMasVendidoPorMes(
    mes: map['mes'],
    nombre: map['nombre'],
    cantidadTotal: map['cantidad_total'],
  );
}
