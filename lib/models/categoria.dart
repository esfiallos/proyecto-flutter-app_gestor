class Categoria {
  final int? id;
  final String nombre;

  Categoria({this.id, required this.nombre});

  factory Categoria.fromMap(Map<String, dynamic> map) => Categoria(
    id: map['id_categoria'],
    nombre: map['nombre'],
  );

  Map<String, dynamic> toMap() => {
    'id_categoria': id,
    'nombre': nombre,
  };
}
