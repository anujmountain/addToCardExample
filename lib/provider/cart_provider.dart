import 'package:flutter/material.dart';

import '../models/cart_item_model.dart';
import '../models/product_list_item_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModel> cartList = [];
  double allProductTotal = 0.0;

  void addToCart(ProductListModel item) {
    // cartList.add(CartItemModel(
    //   id: item.id,
    //   name: item.name,
    //   price: item.price,
    //   quantity: 1,
    //   itemTotal: item.price,
    //   allProductTotal: 0.0,
    // ));
    // calculate();
    notifyListeners();
  }

  // void increment(int index) {
  //     cartList[index].quantity++;
  //   final total = cartList[index].quantity * cartList[index].price;
  //   cartList[index].itemTotal = total;
  //   calculate();
  //
  //   notifyListeners();
  // }
  //
  // void removeCartItem(CartItemModel data){
  //   cartList.remove(data);
  //   calculate();
  //   notifyListeners();
  // }
  void removeAllProducts(){
    cartList.clear();
    notifyListeners();
  }

  //
  // void decrement(int index) {
  //     cartList[index].quantity--;
  //   final total = cartList[index].quantity * cartList[index].price;
  //   cartList[index].itemTotal = total;
  //   calculate();
  //   notifyListeners();
  // }

  // void calculate() {
  //   double total = 0.0;
  //   cartList.forEach((element) {
  //     total += element.itemTotal;
  //   });
  //   allProductTotal = total;
  //   notifyListeners();
  // }
}
