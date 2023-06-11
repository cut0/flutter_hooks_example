import 'package:flutter/material.dart';
import 'package:hooks_example/features/hello_world/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloStateProvider = helloStateNotifierProvider("Hello");
    final helloState = ref.watch(helloStateProvider);
    final helloNotifier = ref.watch(helloStateProvider.notifier);

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${helloState.message} by ${helloState.userName}',
          style: const TextStyle(fontSize: 16),
        ),
        TextField(
            decoration: const InputDecoration(hintText: 'Message'),
            onChanged: (String value) {
              helloNotifier.updateMessage(value);
            }),
        TextField(
            decoration: const InputDecoration(hintText: 'User Name'),
            onChanged: (String value) {
              helloNotifier.updateUserName(value);
            }),
      ],
    ));
  }
}
