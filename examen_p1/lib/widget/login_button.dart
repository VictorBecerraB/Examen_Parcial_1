import 'package:flutter/material.dart';
import 'package:examen_p1/theme/tienda_theme.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;

  const LoginButton({
    super.key,
    this.onPressed,
    this.text = 'Aceptar',
    this.width = 140,
    this.height = 48,
    this.backgroundColor = TiendaTheme.colorPrimario,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
