import 'package:examen_p1/widget/ProductosPage.dart';
import 'package:examen_p1/widget/bottom_nav_bar.dart';
import 'package:examen_p1/widget/carritos_list.dart';
import 'package:examen_p1/widget/header_usuarios.dart';
import 'package:flutter/material.dart';

class CarritoPage extends StatelessWidget {
  const CarritoPage({super.key});

  static const List<String> clientes = [
    'Cliente - 1',
    'Cliente - 1',
    'Cliente - 2',
    'Cliente - 3',
    'Cliente - 3',
    'Cliente - 4',
    'Cliente - 8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            const HeaderUsuarios(title: 'Carritos de compra'),
            Expanded(
              child: CarritosList(
                clientes: clientes,
                onCarritoTap: (cliente) {
                  showDialog<void>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(cliente),
                      content: const Text('Detalles del carrito de compra.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cerrar'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            BottomNavBar(
              selectedIndex: 1,
              onTap: (index) {
                if (index == 0) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ProductosPage(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
