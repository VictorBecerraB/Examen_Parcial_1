import 'package:flutter/material.dart';

class Producto {
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  final IconData icon;
  final Color iconColor;

  const Producto({
    required this.title,
    required this.price,
    required this.description,
    required this.icon,
    required this.iconColor,
    this.imageUrl = '',
  });

  String get displayTitle => '$title - \$${price.toStringAsFixed(2)}';
}
