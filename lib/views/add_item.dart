import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // late final CounterProvider counter;
  // @override
  // void initState() {
  //   counter = Provider.of<CounterProvider>(context, listen: false);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            // Text(counter.count.toString()),
            Text('using getX routing ')
          ],
        ),
      ),
    );
  }
}
