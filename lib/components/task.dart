import 'package:flutter/material.dart';
import 'package:widgets_estudos1/components/difficulty.dart';
import 'package:widgets_estudos1/data/task_dao.dart';

import 'alert_dialog.dart';

class Task extends StatefulWidget {
  final String title;
  final String url;
  final int dificuldade;
  int nivel = 0;

  Task(this.title, this.url, this.dificuldade, this.nivel, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: LinearProgressIndicator(
                            color: Colors.blue.shade100,
                            value: (widget.nivel / widget.dificuldade) / 10,
                          ),
                        ),
                        Text(
                          'Nível: ${widget.nivel}',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            width: 400,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(4)),
                  width: 80,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      widget.url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 24, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Difficulty(
                        difficultyLevel: widget.dificuldade,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(
                    width: 70,
                    height: 60,
                    child: ElevatedButton(
                      onLongPress: () {
                        showAlertDialog(context, widget.title);
                      },
                      onPressed: () async {
                        await TaskDao().save(Task(
                          widget.title,
                          widget.url,
                          widget.dificuldade,
                          ++widget.nivel,
                        ));
                        setState(() {});
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.arrow_drop_up), Text('Lvl Up')],
                      ),
                    ),
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
