import 'dart:convert';

import 'package:examen_p1/model/carrito.dart';
import 'package:examen_p1/model/producto.dart';
import 'package:http/http.dart' as http;

class FakeStoreApi {
  FakeStoreApi({http.Client? client}) : _client = client ?? http.Client();

  static const _baseUrl = 'https://fakestoreapi.com';
  final http.Client _client;

  void close() => _client.close();

  Future<List<Producto>> obtenerProductos() async {
    final json = await _get('/products') as List<dynamic>;
    return json
        .map((item) => Producto.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<Producto> obtenerProducto(int id) async {
    final json = await _get('/products/$id') as Map<String, dynamic>;
    return Producto.fromJson(json);
  }

  Future<List<Carrito>> obtenerCarritos() async {
    final json = await _get('/carts') as List<dynamic>;
    return json
        .map((item) => Carrito.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<dynamic> _get(String path) async {
    final response = await _client
        .get(Uri.parse('$_baseUrl$path'))
        .timeout(const Duration(seconds: 15));
    if (response.statusCode != 200) {
      throw Exception('Error HTTP ${response.statusCode} al consultar $path');
    }
    return jsonDecode(response.body);
  }
}
