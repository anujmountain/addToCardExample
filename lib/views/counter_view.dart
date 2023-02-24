import 'package:flutter/material.dart';
import 'package:flutter_application_1/getx/counter_controller_getx.dart';
import 'package:get/get.dart';

class Counter extends StatelessWidget {
   Counter({Key? key}) : super(key: key);

  // late final CounterProvider counter;
  final CounterController counterController = Get.put(CounterController());

  // @override
  @override
  Widget build(BuildContext context) {
    // print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App using Getx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

        Obx(() => Text(
          '${counterController.count}',
          style: Theme.of(context).textTheme.headline4,
        )
        )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              counterController.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              counterController.decrement();
            },
            tooltip: 'decrement',
            child: const Icon(Icons.remove),
          ),
          // FloatingActionButton(
          //   heroTag: null,
          //   onPressed: () {
          //     Get.toNamed(ClassRoutes.DEMO_ROUTE);
          //   },
          //   child: const Icon(Icons.forward),
          // ),
        ],
      ),
    );
  }
}

