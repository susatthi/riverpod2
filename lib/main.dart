import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/firebase_options.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

@riverpod
String hello(HelloRef ref) => 'hello';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Firebaseの初期化については今回の講座の範囲外なので、事前に済ませておいた。
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: Home()));
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hello = ref.watch(helloProvider);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(hello),
        ),
      ),
    );
  }
}
