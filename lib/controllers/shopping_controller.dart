import 'package:flutter_getx/models/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products = List<Product>().obs;
  var fetching = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 3));
    List<Product> productRes = [
      Product(
          id: 1, name: 'Sayur', desc: 'Sayur segar', image: 'abd', price: 2000),
      Product(
          id: 2, name: 'Buah', desc: 'Buah manis', image: 'abd', price: 4500),
      Product(
          id: 3,
          name: 'Daging',
          desc: 'Daging renyah',
          image: 'abd',
          price: 10000)
    ];
    products.addAll(productRes);
    fetching.value = false;
  }
}
