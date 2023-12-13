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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SafeArea(
          child: Container(
              height: 100,
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
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Level: 0.00',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              onPressed: () {},
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
                    )),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
