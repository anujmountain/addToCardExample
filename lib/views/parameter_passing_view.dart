import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParameterPassingView extends StatelessWidget {
  const ParameterPassingView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(data['appBarTitle'])),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: prefer_interpolation_to_compose_strings
          Text('name: ' + data['name']),
          // ignore: prefer_interpolation_to_compose_strings
          Text('Mobile number: ' + data['mobileNumber']),
        ],
      ),
    );
  }
}
