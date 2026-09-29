import 'package:examen_p1/widget/carrito_item.dart';
import 'package:flutter/material.dart';

class CarritosList extends StatelessWidget {
  final List<String> clientes;
  final ValueChanged<String>? onCarritoTap;

  const CarritosList({super.key, required this.clientes, this.onCarritoTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clientes.length,
      itemBuilder: (context, index) {
        final cliente = clientes[index];
        return CarritoItem(
          cliente: cliente,
          onTap: () => onCarritoTap?.call(cliente),
        );
      },
    );
  }
}
