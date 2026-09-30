import 'package:flutter/material.dart';

class ProductoDetalleAcciones extends StatelessWidget {
  final VoidCallback onAgregar;
  final VoidCallback onEliminar;

  const ProductoDetalleAcciones({
    super.key,
    required this.onAgregar,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: _AccionButton(
              icon: Icons.add_shopping_cart,
              label: 'Agregar',
              onPressed: onAgregar,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _AccionButton(
              icon: Icons.delete_outline,
              label: 'Eliminar',
              onPressed: onEliminar,
            ),
          ),
        ],
      ),
    );
  }
}

class _AccionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _AccionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 42,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    );
  }
}
