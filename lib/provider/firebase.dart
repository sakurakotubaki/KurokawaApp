import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kurokara_app/model/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase.g.dart';

// FirebaseFirestoreをインスタンス化するためのProviderを生成するコード
@riverpod
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}

// Firestoreのtodoコレクションを監視するStreamを生成するコード
@riverpod
Stream<List<TodoModel>> todo(TodoRef ref) {
  return ref.watch(firebaseFirestoreProvider).collection('todo').snapshots().map((e) => e.docs.map((e) => TodoModel.fromJson(e.data())).toList());
}
