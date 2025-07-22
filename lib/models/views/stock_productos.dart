class StockProducto {
  final String nombre;
  final int stock;
  final double precio;
  final double costo;
  final String? imagen; // <-- NUEVO

  StockProducto({
    required this.nombre,
    required this.stock,
    required this.precio,
    required this.costo,
    this.imagen, // <-- NUEVO
  });

  factory StockProducto.fromMap(Map<String, dynamic> map) => StockProducto(
        nombre: map['nombre'],
        stock: map['stock'],
        precio: map['precio'],
        costo: map['costo'],
        imagen: map['imagen'], // <-- NUEVO
      );
}
