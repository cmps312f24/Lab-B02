import 'package:flutter/material.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/repositories/product_repository.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Product? product;
  ProductRepository repository = ProductRepository();

  @override
  void initState() {
    repository.getProductById(widget.productId).then((p) => product = p);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (product != null) ...[
          Image.network(product!.image),
          Text(product!.title),
          Text(product!.description),
          Text(product!.price.toString()),
        ] else
          const CircularProgressIndicator(),
      ],
    );
  }
}
