import 'package:flutter/material.dart';

import '../data/task_dao.dart';

showAlertDialog(BuildContext context, String title) {
  Widget cancelButton = TextButton(
    onPressed: () {
      Navigator.pop(context, 'Não');
    },
    child: const Text('Não'),
  );
  Widget confirmeButton = TextButton(
    onPressed: () {
      TaskDao().delete(title);
      Navigator.pop(context, 'OK');
    },
    child: const Text('OK'),
  );

  AlertDialog alert = AlertDialog(
    title: const Text('Deletar'),
    content: const Text('Tem certeza que quer deletar essa tarefa?'),
    actions: [cancelButton, confirmeButton],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}