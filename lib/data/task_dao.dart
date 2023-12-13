import 'package:widgets_estudos1/components/task.dart';

class TaskDao{
  static const String tableSql =  'CREATE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tableName = 'task';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task task) async {}
  // Future<List<Task>> findAll() async{}
  // Future<List<Task>> find(String nomeTarefa) async{}
  // delete(String nomeTarefa) async {}
}