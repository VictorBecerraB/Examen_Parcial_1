import 'package:examen_p1/model/carrito.dart';
import 'package:examen_p1/widget/ProductosPage.dart';
import 'package:examen_p1/widget/bottom_nav_bar.dart';
import 'package:examen_p1/widget/carritos_list.dart';
import 'package:examen_p1/widget/header_usuarios.dart';
import 'package:examen_p1/service/fake_store_api.dart';
import 'package:flutter/material.dart';

class CarritoPage extends StatefulWidget {
  const CarritoPage({super.key});

  @override
  State<CarritoPage> createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  final _api = FakeStoreApi();
  late Future<List<Carrito>> _carritos;

  @override
  void initState() {
    super.initState();
    _carritos = _api.obtenerCarritos();
  }

  @override
  void dispose() {
    _api.close();
    super.dispose();
  }

  void _reintentar() {
    setState(() => _carritos = _api.obtenerCarritos());
  }

  void _mostrarDetalles(Carrito carrito) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Carrito #${carrito.id}'),
        content: SizedBox(
          width: 340,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cliente ID: ${carrito.userId}'),
              Text(
                'Fecha: ${carrito.date.toLocal().toString().split(' ').first}',
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 220,
                child: ListView(
                  children: carrito.productos.map((producto) {
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text('Producto #${producto.productId}'),
                      trailing: Text('x${producto.quantity}'),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeaderUsuarios(title: 'Carritos de compra'),
            Expanded(
              child: FutureBuilder<List<Carrito>>(
                future: _carritos,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('No se pudieron cargar los carritos.'),
                          const SizedBox(height: 12),
                          FilledButton.tonal(
                            onPressed: _reintentar,
                            child: const Text('Reintentar'),
                          ),
                        ],
                      ),
                    );
                  }
                  final carritos = snapshot.data ?? const <Carrito>[];
                  if (carritos.isEmpty) {
                    return const Center(
                      child: Text('No hay carritos disponibles.'),
                    );
                  }
                  return CarritosList(
                    carritos: carritos,
                    onCarritoTap: _mostrarDetalles,
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
