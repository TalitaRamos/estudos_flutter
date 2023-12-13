import 'package:flutter/material.dart';
import 'package:widgets_estudos1/components/task.dart';
import 'package:widgets_estudos1/data/task_dao.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh))
        ],
        title: const Text('Tarefas'),
      ),
      body: Container(
          color: Colors.blue.shade50,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 70),
            child: FutureBuilder(
                future: TaskDao().findAll(),
                builder: (context, snapshot) {
                  List<Task>? items = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            Text('Carregando'),
                          ],
                        ),
                      );
                    case ConnectionState.waiting:
                      return const Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            Text('Carregando'),
                          ],
                        ),
                      );
                    case ConnectionState.active:
                      return const Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            Text('Carregando'),
                          ],
                        ),
                      );
                    case ConnectionState.done:
                      if (snapshot.hasData && items != null) {
                        if (items.isNotEmpty) {
                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return items[index];
                            },
                          );
                        } else {
                          return const Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 128,
                                  color: Colors.black12,
                                ),
                                Text(
                                  'Não há tarefas cadastradas',
                                  style: TextStyle(
                                    fontSize: 28,
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      } else {
                        return const Center(
                          child:
                              Text('Houve um erro ao acessar o banco de dados'),
                        );
                      }
                  }
                }),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contexNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
