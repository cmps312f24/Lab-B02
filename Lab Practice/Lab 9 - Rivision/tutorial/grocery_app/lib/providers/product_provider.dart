import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/repositories/product_repository.dart';

class ProductNotifier extends Notifier<List<Product>> {
  final _repo = ProductRepository();
  @override
  List<Product> build() {
    // _repo.getProducts().then((products) => {state = products});
    initializeProducts();
    return [];
  }

  void initializeProducts() async {
    try {
      state = await _repo.getProducts();
    } catch (e) {
      state = [];
    }
  }
}

final productNotifierProvider =
    NotifierProvider<ProductNotifier, List<Product>>(() => ProductNotifier());
