import 'package:get/get.dart';

class CartItemModel {
  final int id;
  final String name;
  final double price;
  RxInt quantity;
  RxDouble itemTotal;
  RxDouble allProductTotal;
  CartItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.itemTotal,
    required this.allProductTotal,
  });
}
