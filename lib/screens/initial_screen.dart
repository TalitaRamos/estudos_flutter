import 'package:flutter/material.dart';
import 'package:widgets_estudos1/data/task_inherited.dart';
import 'package:widgets_estudos1/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: Container(
        color: Colors.blue.shade50,
        child: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          children: TaskInherited.of(context).taskList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (contexNew) => FormScreen(taskContext: context,)),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
