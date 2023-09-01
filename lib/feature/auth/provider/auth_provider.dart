import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@riverpod
Stream<User?> currentUser(CurrentUserRef ref) {
  return ref.watch(firebaseAuthProvider).userChanges();
}

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(firebaseAuthProvider).createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
    });
  }
}
