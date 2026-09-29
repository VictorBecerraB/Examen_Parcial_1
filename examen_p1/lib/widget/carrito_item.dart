import 'package:flutter/material.dart';

class CarritoItem extends StatelessWidget {
  final String cliente;
  final VoidCallback? onTap;

  const CarritoItem({super.key, required this.cliente, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 72,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              const Icon(
                Icons.shopping_cart_checkout_rounded,
                size: 44,
                color: Color(0xFFE9A21A),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cliente,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Click para ver detalles',
                      style: TextStyle(fontSize: 14, color: Color(0xFF888888)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
