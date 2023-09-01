import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod2/feature/auth/provider/auth_provider.dart';

void main() {
  test('auth_provider', () async {
    final container = ProviderContainer(overrides: [
      firebaseAuthProvider.overrideWithValue(
        MockFirebaseAuth(),
      ),
    ]);

    addTearDown(container.dispose);

    AsyncValue<User?>? asyncValue;

    container.listen<AsyncValue<User?>>(
      currentUserProvider,
      (previous, next) {
        asyncValue = next;
      },
      fireImmediately: true,
    );

    expect(asyncValue?.value, null);

    await container
        .read(authControllerProvider.notifier)
        .createUserWithEmailAndPassword(
          email: 'test@exmpale.com',
          password: '123456',
        );

    await Future.delayed(const Duration(seconds: 1));

    expect(asyncValue?.value?.email, 'test@exmpale.com');
  });
}
