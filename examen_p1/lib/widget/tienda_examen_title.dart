import 'package:flutter/material.dart';
import 'package:examen_p1/theme/tienda_theme.dart';

class TiendaExamenTitle extends StatelessWidget {
  final String text;
  final IconData icon;
  final double fontSize;
  final Color color;
  final double iconSize;

  const TiendaExamenTitle({
    super.key,
    this.text = 'TIENDA EXAMEN',
    this.icon = Icons.shopping_basket_sharp,
    this.fontSize = 36,
    this.color = TiendaTheme.colorPrimario,
    this.iconSize = 34,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: iconSize),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
            color: color,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
