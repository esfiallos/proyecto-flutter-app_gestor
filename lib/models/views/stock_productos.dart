class StockProducto {
  final String nombre;
  final int stock;
  final double precio;
  final double costo;

  StockProducto({
    required this.nombre,
    required this.stock,
    required this.precio,
    required this.costo,
  });

  factory StockProducto.fromMap(Map<String, dynamic> map) => StockProducto(
    nombre: map['nombre'],
    stock: map['stock'],
    precio: map['precio'],
    costo: map['costo'],
  );
}
