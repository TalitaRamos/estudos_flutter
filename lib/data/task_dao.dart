import 'package:sqflite/sqflite.dart';
import 'package:widgets_estudos1/components/task.dart';
import 'package:widgets_estudos1/data/database.dart';

class TaskDao {
  static const String tableSql = 'CREATE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tableName = 'task';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task task) async {
    final Database database = await getDatabase();
    var itemExists = await find(task.title);

    Map<String, dynamic> taskMap = toMap(task);

    if (itemExists.isEmpty) {
      return await database.insert(_tableName, taskMap);
    } else {
      return await database.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.title],
      );
    }
  }

  Map<String, dynamic> toMap(Task task) {
    Map<String, dynamic> taskMap = Map();

    taskMap[_name] = task.title;
    taskMap[_image] = task.url;
    taskMap[_difficulty] = task.dificuldade;

    return taskMap;
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll:');

    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tableName);
    print('Encontrado: $result');

    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> result) {
    List<Task> tarefas = [];

    for (Map<String, dynamic> linha in result) {
      tarefas.add(Task(linha[_name], linha[_image], linha[_difficulty]));
    }

    return tarefas;
  }

  Future<List<Task>> find(String nomeTarefa) async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeTarefa],
    );

    return toList(result);
  }

  delete(String nomeTarefa) async {
    final Database database = await getDatabase();

    return database.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeTarefa],
    );
  }
}
