import 'package:examen_p1/model/producto.dart';
import 'package:flutter/material.dart';

class ProductoDetalleContenido extends StatelessWidget {
  final Producto producto;

  const ProductoDetalleContenido({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 28, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            producto.title,
            style: const TextStyle(fontSize: 18, height: 1.3),
          ),
          const SizedBox(height: 28),
          SizedBox(
            height: 190,
            child: producto.imageUrl.isEmpty
                ? Icon(producto.icon, size: 110, color: producto.iconColor)
                : Image.network(
                    producto.imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      producto.icon,
                      size: 110,
                      color: producto.iconColor,
                    ),
                  ),
          ),
          const SizedBox(height: 28),
          Text(
            producto.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              height: 1.3,
              color: Color(0xFF444444),
            ),
          ),
          const SizedBox(height: 26),
          Text(
            'Precio: \$${producto.price.toStringAsFixed(2)}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue[600],
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
