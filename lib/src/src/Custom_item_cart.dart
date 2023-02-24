import 'package:flutter/material.dart';
import 'package:flutter_application_1/getx/cart_controller_getx.dart';
import 'package:provider/provider.dart';

import '../../models/cart_item_model.dart';
import '../../models/product_list_item_model.dart';
import '../../provider/cart_provider.dart';
import 'package:get/get.dart';

class CustomItemCart extends StatelessWidget {
  final VoidCallback? onTap;
  final ProductListModel data;

  const CustomItemCart({
    Key? key,
    required this.data,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Image.network(
                    'https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                    fit: BoxFit.fill),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.white,
                  iconSize: 16,
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.price.toString(),
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 18),
                      ),
                      ElevatedButton(onPressed: onTap, child: Icon(Icons.add))
                    ],
                  )
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}

class CustomItemCart2 extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final VoidCallback? increment;
  final VoidCallback? decrement;
  final int index;

  final CartItemModel data;

  CustomItemCart2({
    Key? key,
    required this.data,
    this.increment,
    this.decrement,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Image.network(
                    'https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                    fit: BoxFit.fill),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.white,
                  iconSize: 16,
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.name),
                      const Divider(),
                      Expanded(
                        child: Text(
                          data.price.toString(),
                          style: const TextStyle(
                              color: Colors.deepOrange, fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                data.quantity.value == 1
                                    ? cartController.removeCartItem(data)
                                    : cartController.decrement(index);
                                if (cartController.cartList.isEmpty) {
                                  Navigator.pop(context);
                                }
                              },
                              icon: const Icon(Icons.remove, size: 16),
                              constraints: const BoxConstraints(),
                              splashRadius: 10,
                            ),
                           Obx(() =>  Text(data.quantity.value.toString(),
                               style: const TextStyle(fontSize: 16)),),
                            IconButton(
                              onPressed: () {
                                cartController.increment(index);
                              },
                              icon: const Icon(Icons.add, size: 16),
                              constraints: const BoxConstraints(),
                              splashRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Obx(
                        () {
                          return Text(data.itemTotal.value.toStringAsFixed(2),
                              style: const TextStyle(fontSize: 16));
                        }
                      ),
                      const SizedBox(height: 5.0),
                      ElevatedButton(
                        onPressed: () {
                          cartController.removeCartItem(data);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        child: const Text(
                          'Remove',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
