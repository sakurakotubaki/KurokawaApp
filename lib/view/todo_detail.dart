import 'package:flutter/material.dart';
import 'package:kurokara_app/model/todo.dart';
// 前のページから渡された値を受け取るページ
class TodoDetail extends StatelessWidget {
  const TodoDetail({super.key, required this.todo});
  // TodoModelをデータ型にして受け取る。値を保持してUIに反映する
  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('前の画面から渡された値↓'),
            Text(todo.title),
          ],
        ),
      )
    );
  }
}
