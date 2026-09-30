import 'package:examen_p1/widget/bottom_nav_bar.dart';
import 'package:examen_p1/widget/CarritoPage.dart';
import 'package:examen_p1/model/producto.dart';
import 'package:examen_p1/widget/DetalleProductoPage.dart';
import 'package:examen_p1/widget/header_usuarios.dart';
import 'package:examen_p1/widget/productos_list.dart';
import 'package:examen_p1/service/fake_store_api.dart';
import 'package:flutter/material.dart';

class ProductosPage extends StatefulWidget {
  const ProductosPage({super.key});

  @override
  State<ProductosPage> createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  final _api = FakeStoreApi();
  late Future<List<Producto>> _productos;

  @override
  void initState() {
    super.initState();
    _productos = _api.obtenerProductos();
  }

  @override
  void dispose() {
    _api.close();
    super.dispose();
  }

  void _reintentar() {
    setState(() => _productos = _api.obtenerProductos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeaderUsuarios(),
            Expanded(
              child: FutureBuilder<List<Producto>>(
                future: _productos,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return _MensajeCarga(
                      mensaje: 'No se pudieron cargar los productos.',
                      onReintentar: _reintentar,
                    );
                  }
                  final productos = snapshot.data ?? const <Producto>[];
                  if (productos.isEmpty) {
                    return const Center(
                      child: Text('No hay productos disponibles.'),
                    );
                  }
                  return ProductosList(
                    productos: productos,
                    onProductoTap: (producto) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              DetalleProductoPage(producto: producto),
                        ),
                      );
                    },
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

class _MensajeCarga extends StatelessWidget {
  final String mensaje;
  final VoidCallback onReintentar;

  const _MensajeCarga({required this.mensaje, required this.onReintentar});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(mensaje, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          FilledButton.tonal(
            onPressed: onReintentar,
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }
}
