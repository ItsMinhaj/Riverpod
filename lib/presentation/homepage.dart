import 'package:counter_pod/presentation/riverpod/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Homepage extends HookConsumerWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(appProvider);
    useEffect(() {
      Future.delayed(
        const Duration(milliseconds: 10),
        (() {
          ref.read(appProvider.notifier).init();
        }),
      );
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter with Riverpod"),
      ),
      body: Center(
        child: Text(
          "Your Counter value is: $state",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(appProvider.notifier).increment();
        },
      ),
    );
  }
}
