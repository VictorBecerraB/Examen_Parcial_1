import 'package:examen_p1/widget/bottom_nav_bar.dart';
import 'package:examen_p1/widget/CarritoPage.dart';
import 'package:examen_p1/model/producto.dart';
import 'package:examen_p1/widget/DetalleProductoPage.dart';
import 'package:examen_p1/widget/header_usuarios.dart';
import 'package:examen_p1/widget/productos_list.dart';
import 'package:flutter/material.dart';

class ProductosPage extends StatelessWidget {
  const ProductosPage({super.key});

  @override
  Widget build(BuildContext context) {
    const productos = [
      Producto(
        title: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
        price: 109.95,
        description: 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',
        imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
        icon: Icons.backpack_rounded,
        iconColor: Color(0xFF4C4C4C),
      ),
      Producto(
        title: 'Mens Casual Premium Slim Fit T-Shirts',
        price: 22.30,
        description: 'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight and soft fabric.',
        imageUrl: 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
        icon: Icons.checkroom_rounded,
        iconColor: Color(0xFF777777),
      ),
      Producto(
        title: 'Mens Cotton Jacket',
        price: 55.99,
        description: 'Mens cotton jacket.',
        icon: Icons.style_rounded,
        iconColor: Color(0xFFD9C3A0),
      ),
      Producto(
        title: 'Mens Casual Slim Fit',
        price: 15.99,
        description: 'Mens casual slim fit clothing.',
        icon: Icons.checkroom_rounded,
        iconColor: Color(0xFF3D5A80),
      ),
      Producto(
        title: "John Hardy Women's Legends Naga Bracelet",
        price: 695,
        description: 'Gold and silver dragon station chain bracelet.',
        icon: Icons.watch_rounded,
        iconColor: Color(0xFFB9B9B9),
      ),
      Producto(
        title: 'Solid Gold Petite Micropave',
        price: 168,
        description: 'Solid gold petite micropave jewelry.',
        icon: Icons.diamond_rounded,
        iconColor: Color(0xFFE5D7A6),
      ),
      Producto(
        title: 'White Gold Plated Princess',
        price: 9.99,
        description: 'White gold plated princess jewelry.',
        icon: Icons.diamond_rounded,
        iconColor: Color(0xFFEAD8B7),
      ),
      Producto(
        title: 'Pierced Owl Rose Gold Plated',
        price: 10.99,
        description: 'Pierced owl rose gold plated earrings.',
        icon: Icons.circle_outlined,
        iconColor: Color(0xFFD9B99B),
      ),
      Producto(
        title: 'WD 2TB Elements Portable External Hard Drive',
        price: 64,
        description: 'Portable external hard drive with 2TB capacity.',
        icon: Icons.sd_card_rounded,
        iconColor: Color(0xFF1F1F1F),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: SafeArea(
        child: Column(
          children: [
            const HeaderUsuarios(),
            Expanded(
              child: ProductosList(
                productos: productos,
                onProductoTap: (producto) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          DetalleProductoPage(producto: producto),
                    ),
                  );
                },
              ),
            ),
            BottomNavBar(
              selectedIndex: 0,
              onTap: (index) {
                if (index == 1) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const CarritoPage(),
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
