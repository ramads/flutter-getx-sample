import 'package:flutter/material.dart';
import 'package:flutter_getx/controllers/cart_controller.dart';
import 'package:flutter_getx/controllers/shopping_controller.dart';
import 'package:flutter_getx/models/product.dart';
import 'package:get/get.dart';

class ShoppingScreen extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<ShoppingController>(builder: (controller) {
        return SafeArea(
            child: controller.fetching.value
                ? Text("Loading....")
                : _productList());
      }),
    );
  }

  Widget _productList() {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: shoppingController.products.length,
                itemBuilder: (context, index) {
                  Product product = shoppingController.products[index];
                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${product.name}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text('${product.desc}'),
                                ],
                              ),
                              Text('Rp. ${product.price}',
                                  style: TextStyle(fontSize: 24)),
                            ],
                          ),
                          Obx(() => RaisedButton(
                                onPressed: () {
                                  if (!cartController.isAddedToCart(product)) {
                                    cartController.addToCart(product);
                                  } else {
                                    cartController.removeFromCart(product);
                                  }
                                },
                                color: cartController.isAddedToCart(product)
                                    ? Colors.red
                                    : Colors.blue,
                                textColor: Colors.white,
                                child: Text(
                                    !cartController.isAddedToCart(product)
                                        ? 'Add to Cart'
                                        : 'Remove'),
                              )),
                        ],
                      ),
                    ),
                  );
                })),
        Obx(() => Text(
            'Total Belanja: Rp.' + cartController.totalBelanja().toString())),
        SizedBox(
          height: 100,
        )
      ],
    );
  }

  // void _onLoading() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         child: new Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             new CircularProgressIndicator(),
  //             new Text("Loading"),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  //   new Future.delayed(new Duration(seconds: 3), () {
  //     Navigator.pop(context); //pop dialog
  //     _login();
  //   });
  // }
}
