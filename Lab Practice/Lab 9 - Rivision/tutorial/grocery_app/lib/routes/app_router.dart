import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/screens/product_details_screen.dart';
import 'package:grocery_app/screens/product_screen.dart';

class AppRouter {
  static const productRoute = (name: "product", path: "/");
  static const productDetailsRoute =
      (name: "product-details", path: "/product-details/:id");

  static final routerConfig = GoRouter(
    initialLocation: productRoute.path,
    routes: [
      ShellRoute(
          builder: (context, state, child) => Scaffold(
                appBar: AppBar(
                  title: const Text('Grocery App'),
                ),
                body: child,
              ),
          routes: [
            GoRoute(
                path: productRoute.path,
                name: productRoute.name,
                builder: (context, state) {
                  return const ProductScreen();
                },
                routes: [
                  GoRoute(
                      name: productDetailsRoute.name,
                      path: productDetailsRoute.path,
                      builder: (context, state) {
                        final productId = state.pathParameters['id']!;
                        return ProductDetailsScreen(
                            productId: int.parse(productId));
                      })
                ]),
          ])
    ],
  );
}
