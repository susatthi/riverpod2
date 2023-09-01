import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod2/config/firebase/firestore/firestore_provider.dart';
import 'package:riverpod2/feature/todo/model/todo.dart';
import 'package:riverpod2/feature/todo/provider/todo_provider.dart';

/// 参考：
/// - https://riverpod.dev/docs/cookbooks/testing
/// - https://zenn.dev/mamoru_takami/articles/7c4933fa53a87a
/// - https://qiita.com/Seo-4d696b75/items/eee020162d0537fdbc36

/// テストをする上で便利な機能がたくさんあるので[Mock]クラスを継承する
class Listener<T> extends Mock {
  void call(T? previous, T next);
}

// TODO：完了機能を実装した上でテストコードを追加してみよう。
/// ヒント：完了のための関数を実行したあと、verifyInOrderにて、isCompletedがfalseからtrueに変化することを確かめよう。
/// 初級編でやる人はexpectでisCompletedの値を調べれればいいね。

void main() {
  setUpAll(() {
    /// any関数を使うために必要
    registerFallbackValue(
      const AsyncValue<List<ToDo>>.data([]),
    );
  });

  /// Listenerを使わないバージョン
  /// 毎度ひとつずつexpectで確認する。
  test('初級編：todosのテスト', () async {
    final container = ProviderContainer(
      overrides: [
        /// モックを注入する
        /// 上書きしているイメージ
        firebaseFirestoreProvider.overrideWithValue(
          FakeFirebaseFirestore(),
        ),
      ],
    );

    /// テストが終わったらcontainerをdisposeする
    addTearDown(container.dispose);

    AsyncValue<List<ToDo>>? asyncValue;

    container.listen<AsyncValue<List<ToDo>>>(
      todosProvider,
      (previous, value) {
        asyncValue = value;
      },
    );

    /// 初めはローディング状態
    expect(asyncValue, null);

    /// 読み込みが終わるまで待つ
    await container.read(todosProvider.future);

    /// listとlistの比較はlistEqualsを使う
    expect(listEquals(asyncValue?.value, <ToDo>[]), true);

    const expectedDescription = 'test';

    /// [ToDo]を追加する
    await container
        .read(todoControllerProvider.notifier)
        .addTodo(expectedDescription);

    final description = asyncValue?.value?.firstOrNull?.description;

    /// 追加されたToDoのdescriptionがtestになっているかを確認する。
    expect(description, expectedDescription);
  });

  test('上級編：todosのテスト', () async {
    final container = ProviderContainer(
      overrides: [
        /// モックを注入する
        /// 上書きしているイメージ
        firebaseFirestoreProvider.overrideWithValue(
          FakeFirebaseFirestore(),
        ),
      ],
    );

    /// テストが終わったらcontainerをdisposeする
    addTearDown(container.dispose);

    /// リスナーを使って状態の変化を監視していく
    final listener = Listener<AsyncValue<List<ToDo>>>();

    container.listen<AsyncValue<List<ToDo>>>(
      todosProvider,
      listener,
      fireImmediately: true,
    );

    const expectedDescription = 'test';
    await container.read(todosProvider.future);
    await container
        .read(todoControllerProvider.notifier)
        .addTodo(expectedDescription);

    /// リスナーがどのような変化をしたかその変遷をチェックする
    verifyInOrder([
      /// 初めはnullそこからローディング状態に
      () => listener(null, const AsyncLoading()),

      /// ローディングが終わり、空のリストが得られる
      () => listener(
            const AsyncLoading<List<ToDo>>(),
            any(
              that: isA<AsyncData<List<ToDo>>>().having(
                (value) => value.value.isEmpty,
                'isEmpty',
                true,
              ),
            ),
          ),
      () => listener(
            any(
              that: isA<AsyncData<List<ToDo>>>().having(
                (value) => value.value.isEmpty,
                'isEmpty',
                true,
              ),
            ),
            any(
              that: isA<AsyncData<List<ToDo>>>().having(
                (value) => value.value.firstOrNull?.description,
                'description',
                expectedDescription,
              ),
            ),
          ),
    ]);
  });
}
