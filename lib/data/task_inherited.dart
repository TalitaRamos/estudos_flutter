import 'package:flutter/material.dart';
import 'package:widgets_estudos1/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 4),
    Task('Dormir', 'https://christianefujii.com.br/wp-content/uploads/2020/06/guia-do-sono-14-passos-para-dormir-bem.jpg', 2),
    Task('Comer', 'https://conteudo.imguol.com.br/c/entretenimento/e8/2018/09/24/comer-frutas-kiwi-morango-1537832260642_v2_1x1.jpg', 1),
    Task('Andar de Bike', 'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg', 5),
    Task('Ler', 'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg', 3),
    Task('Meditar', 'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg', 5),
    Task('Jogar', 'https://www.meupositivo.com.br/doseujeito/wp-content/uploads/2020/10/usar-smartphone-android-para-jogar-remotamente.jpg', 3),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
