import 'package:hooks_riverpod/hooks_riverpod.dart';

final appProvider = StateNotifierProvider<AppNotifier, int>((ref) {
  return AppNotifier();
});

class AppNotifier extends StateNotifier<int> {
  AppNotifier() : super(0);

  increment() {
    state = state + 1;
  }

  init() {
    state = state + 5;
  }
}
