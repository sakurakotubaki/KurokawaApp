import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kurokara_app/model/todo.dart';
import 'package:kurokara_app/provider/firebase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo.g.dart';
// ロジックは書かないベースとなるインターフェース
abstract class TodoRepository {
  // Future<void> addTodo(String todoController);
  Future<void> addTodo(TodoModel todo);
}

/// TODO: 名前の競合が起きたのかTodoRepoにした!
@Riverpod(keepAlive: true)
TodoRepositoryImpl todoRepo(TodoRepoRef ref) {
  return TodoRepositoryImpl(ref);
}

// override(上書き)して、addTodoにロジックを実装する
class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl(this.ref);
  final Ref ref;

  // Firestoreのtodoコレクションにformの値を追加する
  @override
  Future<void> addTodo(TodoModel todo) async {
    await ref
        .read(firebaseFirestoreProvider)
        .collection('todo')
        .add(todo.toJson());// withConverterを使ってないので、toJson()が必要
  }
}
