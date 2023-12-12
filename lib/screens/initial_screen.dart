import 'package:flutter/material.dart';
import 'package:widgets_estudos1/data/task_inherited.dart';
import 'package:widgets_estudos1/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  double level = 0;
  double progress = 0;
  void refreshGeneralLevel() {
    setState(() {
      level = 0;
      progress = 0;
      for (var task in TaskInherited.of(context).taskList) {
        level += (task.nivel * task.dificuldade) / 10;
      }
      progress = level / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SafeArea(
          child: Container(
              height: 120,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Tarefas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 240,
                            child: LinearProgressIndicator(
                              color: Colors.blue.shade100,
                              value: progress,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Level: ${level.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  refreshGeneralLevel();
                                });
                              },
                              icon: const Icon(
                                Icons.autorenew_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
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
            MaterialPageRoute(
                builder: (contexNew) => FormScreen(
                      taskContext: context,
                    )),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
