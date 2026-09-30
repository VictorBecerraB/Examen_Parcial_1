import 'package:examen_p1/model/producto.dart';
import 'package:flutter/material.dart';

class ProductoItem extends StatelessWidget {
  final Producto producto;
  final VoidCallback? onTap;

  const ProductoItem({super.key, required this.producto, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: producto.imageUrl.isEmpty
                    ? Icon(producto.icon, size: 28, color: producto.iconColor)
                    : Image.network(
                        producto.imageUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          producto.icon,
                          size: 28,
                          color: producto.iconColor,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                producto.displayTitle,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
