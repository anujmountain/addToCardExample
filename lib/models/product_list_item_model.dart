import 'package:get/get.dart';

class ProductListModel {
  final int id;
  final String name;
   RxDouble price;
  ProductListModel({required this.id, required this.name, required this.price});
}
