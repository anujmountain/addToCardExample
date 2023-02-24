import 'package:flutter_application_1/views/cart_view.dart';
import 'package:flutter_application_1/views/parameter_passing_view.dart';
import 'package:flutter_application_1/views/product_view.dart';
import 'package:get/get.dart';

class ClassRoutes {
  static const String INITIAL_ROUTE = '/homePage';
  static const String CART_ROUTE = '/cartPage';
  static const String PARAMETER_PASSING_ROUTE = '/ParameterPassingPage';
}

final allRoutes = [
  GetPage(name: ClassRoutes.INITIAL_ROUTE, page: () => ProductView()),
  GetPage(name: ClassRoutes.CART_ROUTE, page: () => CartView()),
  GetPage(
      name: ClassRoutes.PARAMETER_PASSING_ROUTE,
      page: () => const ParameterPassingView())
];
