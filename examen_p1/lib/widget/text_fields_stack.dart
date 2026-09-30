import 'package:examen_p1/widget/login_button.dart';
import 'package:examen_p1/widget/tienda_examen_title.dart';
import 'package:flutter/material.dart';

class CuadrosDeLogin extends StatefulWidget {
  final TiendaExamenTitle title;
  final LoginButton button;
  final VoidCallback onValidSubmit;

  const CuadrosDeLogin({
    super.key,
    required this.title,
    required this.button,
    required this.onValidSubmit,
  });

  @override
  State<CuadrosDeLogin> createState() => _CuadrosDeLoginState();
}

class _CuadrosDeLoginState extends State<CuadrosDeLogin> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.title,
          const SizedBox(height: 30),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Usuario / Correo',
                  ),
                  validator: _validarCampo,
                ),
                const SizedBox(height: 18),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Contraseña'),
                  validator: _validarCampo,
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          LoginButton(
            text: widget.button.text,
            width: widget.button.width,
            height: widget.button.height,
            backgroundColor: widget.button.backgroundColor,
            textColor: widget.button.textColor,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onValidSubmit();
              }
            },
          ),
        ],
      ),
    );
  }

  String? _validarCampo(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }
}
