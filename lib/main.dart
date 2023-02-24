import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/class_routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetXMyApp());
}

class GetXMyApp extends StatelessWidget {
  const GetXMyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: ClassRoutes.INITIAL_ROUTE,
      getPages: allRoutes,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
