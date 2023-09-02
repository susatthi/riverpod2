import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/feature/couner/provider/counter_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  static const path = '/counter';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// stateそのものを見たいなら
    /// ref.watch(provider)
    ///
    /// notifierをみたいなら
    /// ref.read(provider.notifier)
    final count = ref.watch(counterProvider);
    return Scaffold(
      body: Center(
        child: Text(count.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
