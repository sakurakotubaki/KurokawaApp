import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'counter.g.dart';

// flutter pub run build_runner watch --delete-conflicting-outputs

/// これは普通うのProvider
// @riverpodのアノテーションをつけると状態が最初から破棄されてしまう。
// @riverpod
// int count(CountRef ref) {
//   return 0;
// }

// 状態を破棄しないようにするには、`@Riverpod(keepAlive: true)`を使う
// @Riverpod(keepAlive: true)
// int counter(CounterRef ref) {
//   return 0;
// }

@riverpod
class Count extends _$Count {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state--;
  }
}
