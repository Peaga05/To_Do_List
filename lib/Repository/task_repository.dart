import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/database/bd.dart';
import 'package:to_do_list/model/task.dart';

class TaskRepository extends ChangeNotifier {
  late Database db;

  List<Task> _task = [];

  List<Task> get task => _task;

  getTasks() async {
    db = await BancoDeDados.instance.database;
    List tarefas = await db.query('tarefas');
    notifyListeners();
    return tarefas;
  }

  setTask(String task) async {
    db = await BancoDeDados.instance.database;
    await db.insert("tarefas", {"tarefa" : task});
  }

  deleteTask(int id) async{
    db = await BancoDeDados.instance.database;
    await db.delete("tarefas",where: 'id = ?' ,whereArgs: [id]);
  }
}
