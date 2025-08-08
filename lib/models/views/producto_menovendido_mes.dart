class ProductoMenosVendidoPorMes {
  final String mes;
  final String nombre;
  final int cantidadTotal;

  ProductoMenosVendidoPorMes({
    required this.mes,
    required this.nombre,
    required this.cantidadTotal,
  });

  factory ProductoMenosVendidoPorMes.fromMap(Map<String, dynamic> map) {
    return ProductoMenosVendidoPorMes(
      mes: map['mes']?.toString() ?? 'Desconocido',
      nombre: map['nombre']?.toString() ?? 'Desconocido',
      cantidadTotal: map['cantidad_total'] is int
          ? map['cantidad_total']
          : int.tryParse(map['cantidad_total']?.toString() ?? '') ?? 0,
    );
  }
}