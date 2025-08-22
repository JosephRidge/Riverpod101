import 'package:flutter_riverpod/flutter_riverpod.dart';


class CountProvider extends Notifier<int> {
  // state
  @override
  int build() => 0;

  // methods to manipulate this state

  void increment() {
    state = state++;
  }
}
