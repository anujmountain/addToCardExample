import 'package:flutter/material.dart';
import 'package:flutter_application_1/getx/cart_controller_getx.dart';
import 'package:flutter_application_1/src/src/Custom_item_cart.dart';
import 'package:get/get.dart';

import '../routes/class_routes.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appTitle = Get.arguments as String;
    return Scaffold(
      appBar: _appBar(context, appTitle),
      body: _body(context),
    );
  }

  PreferredSizeWidget? _appBar(BuildContext context, String appTitle) {
    return AppBar(
      title: Text(appTitle),
      actions: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {
                cartController.removeAllProducts();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete_forever_sharp),
            ))
      ],
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = cartController.cartList[index];
                  return CustomItemCart2(
                    index: index,
                    data: item,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: cartController.cartList.length);
          }),
          _totalPriceButton(context),
          TextButton(
              onPressed: (() =>
                  Get.toNamed(ClassRoutes.PARAMETER_PASSING_ROUTE, arguments: {
                    'appBarTitle': 'Data from another screen',
                    'name': 'Rocky Mountain technologies',
                    'mobileNumber': '7974864839',
                  })),
              child: const Text('See Passing data from another screen'))
        ],
      ),
    );
  }

  Widget _totalPriceButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
          onPressed: () {},
          child: Obx(() {
            return Text(
                'Total Amount  ${cartController.allProductTotal.value.toStringAsFixed(2)}');
          }),
        ))
      ],
    );
  }
}
