import 'package:flutter/material.dart';
import 'package:flutter_application_1/getx/cart_controller_getx.dart';
import 'package:flutter_application_1/models/product_list_item_model.dart';
import 'package:flutter_application_1/routes/class_routes.dart';
import 'package:flutter_application_1/src/src/Custom_item_cart.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key}) : super(key: key);
  final CartController cartController = Get.put(CartController());
  RxList productList = <ProductListModel>[
    ProductListModel(id: 1, name: "Burger", price: 5.99.obs),
    ProductListModel(id: 2, name: "Chess Burger", price: 4.99.obs),
    ProductListModel(id: 3, name: "Tandoori Burger", price: 9.99.obs),
    ProductListModel(id: 4, name: "Grill Burger", price: 3.99.obs),
  ].obs;

  // List<ProductListModel> productList = [
  //   ProductListModel(id: 1, name: "Burger", price: 5.99),
  //   ProductListModel(id: 2, name: "Chess Burger", price: 4.99),
  //   ProductListModel(id: 3, name: "Tandoori Burger", price: 9.99),
  //   ProductListModel(id: 4, name: "Grill Burger", price: 3.99),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Product Screen')),
        body: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(left: 0),
          child: _body(context),
        ),
        floatingActionButton: Obx(() => cartController.cartList.isNotEmpty
            ? _addToCartButton(context)
            : const SizedBox()));
  }

  Widget _body(BuildContext context) {
    return Obx(() => ListView.separated(
        itemBuilder: (context, index) {
          final item = productList[index];
          return CustomItemCart(
            data: item,
            onTap: () {
              cartController.addToCart(item);
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: productList.length));
  }

  Widget _addToCartButton(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Get.toNamed(ClassRoutes.CART_ROUTE, arguments: 'Add to Cart Screen');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(cartController.cartList.length.toString()),
            const SizedBox(height: 5),
            const Icon(
              Icons.add_shopping_cart_sharp,
              color: Colors.white,
            ),
          ],
        ));
  }
}
