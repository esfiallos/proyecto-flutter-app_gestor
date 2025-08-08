class ProductoMasVendido {
  final String nombre;
  final int totalVendido;

  ProductoMasVendido({
    required this.nombre,
    required this.totalVendido,
  });

  factory ProductoMasVendido.fromMap(Map<String, dynamic> map) {
    return ProductoMasVendido(
      nombre: map['nombre']?.toString() ?? 'Desconocido',
      totalVendido: map['total_vendido'] is int
          ? map['total_vendido']
          : int.tryParse(map['total_vendido']?.toString() ?? '') ?? 0,
    );
  }
}