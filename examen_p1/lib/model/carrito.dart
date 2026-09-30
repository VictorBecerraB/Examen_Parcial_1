class CarritoProducto {
  final int productId;
  final int quantity;

  const CarritoProducto({required this.productId, required this.quantity});

  factory CarritoProducto.fromJson(Map<String, dynamic> json) {
    return CarritoProducto(
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
    );
  }
}

class Carrito {
  final int id;
  final int userId;
  final DateTime date;
  final List<CarritoProducto> productos;

  const Carrito({
    required this.id,
    required this.userId,
    required this.date,
    required this.productos,
  });

  factory Carrito.fromJson(Map<String, dynamic> json) {
    return Carrito(
      id: json['id'] as int,
      userId: json['userId'] as int,
      date: DateTime.parse(json['date'] as String),
      productos: (json['products'] as List<dynamic>)
          .map((item) => CarritoProducto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
