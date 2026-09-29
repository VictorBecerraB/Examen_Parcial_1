import 'package:examen_p1/model/producto.dart';
import 'package:examen_p1/widget/producto_item.dart';
import 'package:flutter/material.dart';

class ProductosList extends StatelessWidget {
  final List<Producto> productos;
  final ValueChanged<Producto>? onProductoTap;

  const ProductosList({super.key, required this.productos, this.onProductoTap});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 0),
      itemCount: productos.length,
      separatorBuilder: (_, __) =>
          const Divider(height: 1, thickness: 1, color: Color(0xFFD6D6D6)),
      itemBuilder: (context, index) {
        return ProductoItem(
          producto: productos[index],
          onTap: () => onProductoTap?.call(productos[index]),
        );
      },
    );
  }
}
