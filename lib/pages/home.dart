import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    final doubleCounter = useState(0);

    useValueChanged<int, void>(counter.value, (oldVal, oldResult) {
      doubleCounter.value = counter.value * 2;
    });

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          counter.value.toString(),
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          doubleCounter.value.toString(),
          style: const TextStyle(fontSize: 16),
        ),
        TextButton(
            onPressed: () {
              counter.value++;
            },
            child: const Text(
              "Click me",
              style: TextStyle(fontSize: 16),
            ))
      ],
    ));
  }
}
