

import 'package:estore/product.dart';

class ShoppingCart {
  static List<Product> products = [];

  static void addProduct(Product product) {
    products.add(product);
  }

  static void removeProduct(Product product) {
    products.remove(product);
  }

  static double get totalPrice {
    return products.fold(0, (sum, product) => sum + product.price);
  }

  static void clearCart() {
    products.clear();
  }
}
