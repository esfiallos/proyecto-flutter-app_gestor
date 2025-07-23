class Usuario {
  final int? id;
  final String nombre;
  final String apellido;
  final String correo;
  final String contrasena;
  final String? whatsapp;
  final String? instagram;
  final String? imagenPerfil;
  final String? pais;
  final String? ubicacion;

  Usuario({
    this.id,
    required this.nombre,
    required this.apellido,
    required this.correo,
    required this.contrasena,
    this.whatsapp,
    this.instagram,
    this.imagenPerfil,
    this.pais,
    this.ubicacion,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) => Usuario(
        id: map['id_usuario'],
        nombre: map['nombre'],
        apellido: map['apellido'],
        correo: map['correo'],
        contrasena: map['contraseña'],
        whatsapp: map['whatsapp'],
        instagram: map['instagram'],
        imagenPerfil: map['imagen_perfil'],
        pais: map['pais'],
        ubicacion: map['ubicacion'],
      );

  Map<String, dynamic> toMap() => {
        'id_usuario': id,
        'nombre': nombre,
        'apellido': apellido,
        'correo': correo,
        'contraseña': contrasena,
        'whatsapp': whatsapp,
        'instagram': instagram,
        'imagen_perfil': imagenPerfil,
        'pais': pais,
        'ubicacion': ubicacion,
      };

  Usuario copyWith({
    int? id,
    String? nombre,
    String? apellido,
    String? correo,
    String? contrasena,
    String? whatsapp,
    String? instagram,
    String? imagenPerfil,
    String? pais,
    String? ubicacion,
  }) {
    return Usuario(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      correo: correo ?? this.correo,
      contrasena: contrasena ?? this.contrasena,
      whatsapp: whatsapp ?? this.whatsapp,
      instagram: instagram ?? this.instagram,
      imagenPerfil: imagenPerfil ?? this.imagenPerfil,
      pais: pais ?? this.pais,
      ubicacion: ubicacion ?? this.ubicacion,
    );
  }
}