import 'package:flutter/material.dart';

class HeaderUsuarios extends StatelessWidget {
  final String title;

  const HeaderUsuarios({super.key, this.title = 'Usuarios'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
