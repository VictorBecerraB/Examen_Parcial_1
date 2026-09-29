import 'package:examen_p1/model/producto.dart';
import 'package:examen_p1/widget/producto_detalle_acciones.dart';
import 'package:examen_p1/widget/producto_detalle_contenido.dart';
import 'package:flutter/material.dart';

class DetalleProductoPage extends StatelessWidget {
  final Producto producto;

  const DetalleProductoPage({super.key, required this.producto});

  void _mostrarMensaje(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(mensaje)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text('Detalle del producto'),
        centerTitle: true,
        backgroundColor: Colors.blue[500],
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ProductoDetalleContenido(producto: producto),
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
