import 'package:get/get.dart';

class CounterController extends GetxController {
  final count = 0.obs;
  int increment() => count.value++;
  int decrement() => count.value--;
}
