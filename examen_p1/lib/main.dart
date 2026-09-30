import 'package:examen_p1/widget/login_button.dart';
import 'package:examen_p1/widget/text_fields_stack.dart';
import 'package:examen_p1/widget/tienda_examen_title.dart';
import 'package:examen_p1/theme/tienda_theme.dart';
import 'package:flutter/material.dart';
import 'package:examen_p1/widget/ProductosPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TiendaTheme.claro,
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return Center(
              child: CuadrosDeLogin(
                title: const TiendaExamenTitle(
                  text: 'TIENDA EXAMEN',
                  color: TiendaTheme.colorPrimario,
                  fontSize: 36,
                  iconSize: 34,
                ),
                onValidSubmit: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProductosPage(),
                    ),
                  );
                },
                button: LoginButton(text: 'Aceptar'),
              ),
            );
          },
        ),
      ),
    );
  }
}
