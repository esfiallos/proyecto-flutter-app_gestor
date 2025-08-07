class StockProducto {
  final String nombre;
  final int stock;
  final double precio;
  final double costo;
  final String? imagen;
  final int? idCategoria;  // <-- nuevo

  StockProducto({
    required this.nombre,
    required this.stock,
    required this.precio,
    required this.costo,
    this.imagen,
    this.idCategoria,
  });

  factory StockProducto.fromMap(Map<String, dynamic> map) => StockProducto(
        nombre: map['nombre'],
        stock: map['stock'],
        precio: map['precio'],
        costo: map['costo'],
        imagen: map['imagen'],
        idCategoria: map['id_categoria'],  // <-- nuevo
      );
}