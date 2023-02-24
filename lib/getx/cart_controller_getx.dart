import 'package:get/get.dart';

import '../models/cart_item_model.dart';
import '../models/product_list_item_model.dart';

class CartController extends GetxController {
  RxList<CartItemModel> cartList = RxList<CartItemModel>([]);
  RxDouble allProductTotal = 0.0.obs;

  void addToCart(ProductListModel item) {
    cartList.add(CartItemModel(
      id: item.id,
      name: item.name,
      price: item.price.value,
      quantity: 1.obs,
      itemTotal: item.price,
      allProductTotal: 0.0.obs,
    ));
    calculate();
  }

  void increment(int index) {
    
    cartList[index].quantity.value++;
    double total = cartList[index].quantity.value * cartList[index].price;
    cartList[index].itemTotal.value = total;
    calculate();
  }

  void removeCartItem(CartItemModel data) {
    cartList.remove(data);
    calculate();
  }

  void removeAllProducts() {
    cartList.clear();
  }

  void decrement(int index) {
    cartList[index].quantity.value--;
    double total = cartList[index].quantity.value * cartList[index].price;
    cartList[index].itemTotal.value = total;
    calculate();
  }

  void calculate() {
    RxDouble total = 0.0.obs;
    for (var element in cartList) {
      total.value += element.itemTotal.value;
    }
    allProductTotal.value = total.value;
  }
}
