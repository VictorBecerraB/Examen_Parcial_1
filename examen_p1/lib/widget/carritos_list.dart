import 'package:examen_p1/model/carrito.dart';
import 'package:examen_p1/widget/carrito_item.dart';
import 'package:flutter/material.dart';

class CarritosList extends StatelessWidget {
  final List<Carrito> carritos;
  final ValueChanged<Carrito>? onCarritoTap;

  const CarritosList({super.key, required this.carritos, this.onCarritoTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carritos.length,
      itemBuilder: (context, index) {
        final carrito = carritos[index];
        return CarritoItem(
          carrito: carrito,
          onTap: () => onCarritoTap?.call(carrito),
        );
      },
    );
  }
}
