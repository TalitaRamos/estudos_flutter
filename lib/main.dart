import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          primaryColor: Colors.blue,
          appBarTheme: const AppBarTheme(
              color: Colors.blue,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: const Text('Tarefas'),
          ),
          body: Container(
            color: Colors.blue.shade50,
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  child: ListView(
                    children: const [
                      Task('Aprender Flutter com  Lucas'),
                      Task('Dormir'),
                      Task('comer'),
                    ],
                  ),
                )),
          ),
        ));
  }
}

class Task extends StatefulWidget {
  final String title;

  const Task(this.title, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Container(
              color: Colors.blue,
              width: 400,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Nível: $nivel',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Container(
            color: Colors.white,
            width: 400,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.grey.shade400,
                  width: 80,
                  height: 150,
                ),
                Container(
                  width: 200,
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      nivel++;
                    });
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.arrow_drop_up), Text('Lvl Up')],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
