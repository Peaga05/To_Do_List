import 'package:flutter/material.dart';
import 'package:to_do_list/Repository/task_repository.dart';

class ListarTarefas extends StatefulWidget {
  const ListarTarefas({super.key});

  @override
  State<ListarTarefas> createState() => _ListarTarefasState();
}

class _ListarTarefasState extends State<ListarTarefas> {
  final taskRepository = TaskRepository();
  List<Map> tasks = [];
  @override
  void initState() {
    super.initState();
    getTasks();
  }

  getTasks() async {
    tasks = await taskRepository.getTasks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF334f53),
      appBar: AppBar(
        title: const Text('Tarefas'),
        centerTitle: true,
        shadowColor: const Color(0xFF334f53),
        backgroundColor: const Color(0xFFe1e3ac),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(
                    12.0), // Defina o padding desejado aqui
                child: Text(
                  tasks[index]["tarefa"],
                  style:
                      const TextStyle(color: Color(0xFFe1e3ac), fontSize: 25.0),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await taskRepository.deleteTask(tasks[index]["id"]);
                  await getTasks();
                  setState(() {});
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFFe1e3ac),
                  ),
                ),
                child: const Text(
                  'Excluir',
                  style: TextStyle(
                    color: Color(0xFF334f53),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
