class ProductoMenosVendidoPorMes {
  final String mes;
  final String nombre;
  final int cantidadTotal;

  ProductoMenosVendidoPorMes({
    required this.mes,
    required this.nombre,
    required this.cantidadTotal,
  });

  factory ProductoMenosVendidoPorMes.fromMap(Map<String, dynamic> map) => ProductoMenosVendidoPorMes(
    mes: map['mes'],
    nombre: map['nombre'],
    cantidadTotal: map['cantidad_total'],
  );
}
