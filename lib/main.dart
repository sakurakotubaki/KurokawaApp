import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kurokara_app/firebase_options.dart';
import 'package:kurokara_app/model/todo.dart';
import 'package:kurokara_app/provider/firebase.dart';
import 'package:kurokara_app/repository/todo.dart';

import 'view/todo_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final todoController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('サンプル'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                controller: todoController,
                decoration: const InputDecoration(
                  hintText: '値を入れて',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  final todo = TodoModel(title: todoController.text);
                  await ref.read(todoRepoProvider).addTodo(todo);
                },
                child: const Text('追加')),
            Expanded(
              child: todos.when(
                data: (todo) {
                  return ListView.builder(
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      final db = todo[index];
                      return ListTile(
                        onTap: () {
                          /* Listをタップすると詳細画面に遷移
                          次のページにFirestoreから取得したデータを渡す
                          */
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TodoDetail(todo: db),
                            ),
                          );
                        },
                        title: Text(db.title),
                      );
                    },
                  );
                },
                error: (e, s) => Text(e.toString()),
                loading: () => const CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
