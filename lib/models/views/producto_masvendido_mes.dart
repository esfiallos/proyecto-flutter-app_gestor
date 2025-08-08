class ProductoMasVendidoPorMes {
  final String mes;
  final String nombre;
  final int cantidadTotal;

  ProductoMasVendidoPorMes({
    required this.mes,
    required this.nombre,
    required this.cantidadTotal,
  });

  factory ProductoMasVendidoPorMes.fromMap(Map<String, dynamic> map) {
    return ProductoMasVendidoPorMes(
      mes: map['mes']?.toString() ?? 'Desconocido',
      nombre: map['nombre']?.toString() ?? 'Desconocido',
      cantidadTotal: map['cantidad_total'] is int
          ? map['cantidad_total']
          : int.tryParse(map['cantidad_total']?.toString() ?? '') ?? 0,
    );
  }
}