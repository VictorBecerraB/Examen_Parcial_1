import 'package:flutter/material.dart';

class SegundaPantalla extends StatelessWidget {
  const SegundaPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segunda pantalla')),
      body: const Center(child: Text('¡Ya entré a otra pantalla!')),
    );
  }
}
