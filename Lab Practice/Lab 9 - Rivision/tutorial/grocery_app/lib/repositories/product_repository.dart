import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/model/product.dart';

class ProductRepository {
  // two methods
  final _dio = Dio();

  final baseURL = 'https://dummyjson.com/products';

  Future<List<Product>> getProducts() async {
    Response response = await _dio.get(baseURL);

    if (response.statusCode == 200) {
      var productMap = response.data["products"];

      List<Product> products = [];
      for (var map in productMap) {
        products.add(Product.fromJson(map));
      }
      print(products);
      return products;
    }
    return throw Exception('Failed to load products');
  }

  Future<Product> getProductById(int id) async {
    Response response = await _dio.get('$baseURL/$id');
    if (response.statusCode == 200) {
      return Product.fromJson(response.data);
    }
    return throw Exception('Failed to load product');
  }
}
