import 'package:examen_p1/model/producto.dart';
import 'package:examen_p1/service/fake_store_api.dart';
import 'package:examen_p1/widget/producto_detalle_acciones.dart';
import 'package:examen_p1/widget/producto_detalle_contenido.dart';
import 'package:flutter/material.dart';

class DetalleProductoPage extends StatefulWidget {
  final Producto producto;

  const DetalleProductoPage({super.key, required this.producto});

  @override
  State<DetalleProductoPage> createState() => _DetalleProductoPageState();
}

class _DetalleProductoPageState extends State<DetalleProductoPage> {
  final _api = FakeStoreApi();
  late Future<Producto> _producto;

  @override
  void initState() {
    super.initState();
    _producto = _api.obtenerProducto(widget.producto.id);
  }

  @override
  void dispose() {
    _api.close();
    super.dispose();
  }

  void _mostrarMensaje(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(mensaje)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del producto')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<Producto>(
                future: _producto,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('No se pudo cargar el producto.'),
                          const SizedBox(height: 12),
                          FilledButton.tonal(
                            onPressed: () => setState(() {
                              _producto = _api.obtenerProducto(
                                widget.producto.id,
                              );
                            }),
                            child: const Text('Reintentar'),
                          ),
                        ],
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    child: ProductoDetalleContenido(producto: snapshot.data!),
                  );
                },
              ),
            ),
            ProductoDetalleAcciones(
              onAgregar: () =>
                  _mostrarMensaje(context, 'Producto agregado al carrito'),
              onEliminar: () =>
                  _mostrarMensaje(context, 'Producto eliminado del carrito'),
            ),
          ],
        ),
      ),
    );
  }
}
