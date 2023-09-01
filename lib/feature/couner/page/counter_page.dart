import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// stateそのものを見たいなら
    /// ref.watch(provider)
    ///
    /// notifierをみたいなら
    /// ref.read(provider.notifier)
    return Scaffold(
      body: const Center(

          /// ここに数字を表示させよう
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// ここでカウントアップ関数を実行させよう
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
