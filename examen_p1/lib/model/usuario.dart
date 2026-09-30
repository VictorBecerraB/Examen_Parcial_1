class Usuario {
  final int id;
  final String nombre;
  final String apellido;

  const Usuario({
    required this.id,
    required this.nombre,
    required this.apellido,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as Map<String, dynamic>? ?? {};
    return Usuario(
      id: json['id'] as int,
      nombre: name['firstname'] as String? ?? '',
      apellido: name['lastname'] as String? ?? '',
    );
  }

  String get nombreCompleto => '$nombre $apellido'.trim();
}
