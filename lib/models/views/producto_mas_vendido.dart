class ProductoMasVendido {
  final String nombre;
  final int totalVendido;

  ProductoMasVendido({
    required this.nombre,
    required this.totalVendido,
  });

  factory ProductoMasVendido.fromMap(Map<String, dynamic> map) => ProductoMasVendido(
    nombre: map['nombre'],
    totalVendido: map['total_vendido'],
  );
}
