import 'package:flutter/material.dart';

class Producto {
  final int id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  final String category;
  final IconData icon;
  final Color iconColor;

  const Producto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.category = '',
    required this.icon,
    required this.iconColor,
    this.imageUrl = '',
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    final category = json['category'] as String? ?? '';
    final (icon, iconColor) = switch (category) {
      "men's clothing" => (Icons.checkroom_rounded, const Color(0xFF536B65)),
      'jewelery' => (Icons.diamond_rounded, const Color(0xFFB28A52)),
      'electronics' => (Icons.devices_rounded, const Color(0xFF527189)),
      _ => (Icons.shopping_bag_rounded, const Color(0xFF6E7560)),
    };

    return Producto(
      id: json['id'] as int,
      title: json['title'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String? ?? '',
      category: category,
      imageUrl: json['image'] as String? ?? '',
      icon: icon,
      iconColor: iconColor,
    );
  }

  String get displayTitle => '$title - \$${price.toStringAsFixed(2)}';
}
