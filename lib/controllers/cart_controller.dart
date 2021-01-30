import 'package:flutter_getx/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartProducts = List<Product>().obs;

  bool addToCart(Product product) {
    if (this.cartProducts.length > 0) {
      for (var i = 0; i < this.cartProducts.length; i++) {
        if (product.id == this.cartProducts[i].id) return false;
      }
    }
    this.cartProducts.add(product);
    return true;
  }

  bool isAddedToCart(Product product) {
    return this.cartProducts.contains(product);
  }

  void removeFromCart(Product product) {
    return this.cartProducts.removeWhere((item) => item.id == product.id);
  }

  double totalBelanja() {
    double total = 0;
    for (var i = 0; i < this.cartProducts.length; i++) {
      total = total + cartProducts[i].price;
    }
    return total;
  }
}
