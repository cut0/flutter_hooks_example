import 'package:hooks_riverpod/hooks_riverpod.dart';

final helloStateNotifierProvider =
    StateNotifierProvider.family<HelloStateNotifier, HelloState, String>(
        (ref, params) {
  return HelloStateNotifier(
      helloState: HelloState(message: params, userName: ""));
});

class HelloState {
  HelloState({required this.message, required this.userName});
  final String message;
  final String userName;
}

class HelloStateNotifier extends StateNotifier<HelloState> {
  HelloStateNotifier({required this.helloState}) : super(helloState);
  HelloState helloState;

  void updateUserName(String newUserName) {
    state = HelloState(message: helloState.message, userName: newUserName);
  }

  void updateMessage(String newMessage) {
    state = HelloState(message: newMessage, userName: helloState.userName);
  }

  void resetMessage() {
    state = HelloState(message: "", userName: helloState.userName);
  }
}
