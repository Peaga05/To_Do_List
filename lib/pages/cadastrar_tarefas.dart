import 'package:flutter/material.dart';
import 'package:to_do_list/Repository/task_repository.dart';

class CadastrarTarefas extends StatefulWidget {
  const CadastrarTarefas({super.key});

  @override
  State<CadastrarTarefas> createState() => _CadastrarTarefasState();
}

class _CadastrarTarefasState extends State<CadastrarTarefas> {
  final tarefaText = TextEditingController();

void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: const Text("Campo vazio!"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o alerta
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sucesso!'),
          content: const Text("Tarefa cadastrada com sucesso"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o alerta
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final task = TaskRepository();
    return Scaffold(
      backgroundColor: const Color(0xFF334f53),
      appBar: AppBar(
        title: const Text('Cadastrar Tarefa'),
        centerTitle: true,
        shadowColor: const Color(0xFF334f53),
        backgroundColor: const Color(0xFFe1e3ac),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Digite a tarefa...',
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFe1e3ac)),
                  ),
                  labelStyle: TextStyle(color: Color(0xFFe1e3ac)),
                ),
                style: const TextStyle(color: Color(0xFFe1e3ac)),
                controller: tarefaText,
                cursorColor: const Color(0xFFe1e3ac),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 400, 
                child: ElevatedButton(
                  onPressed: () async {
                    if(tarefaText.text.isNotEmpty){
                     await task.setTask(tarefaText.text);
                     tarefaText.text = "";
                     setState(() {
                       
                     });
                     _showDialog(context);
                    }else{
                      _showErrorDialog(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFFe1e3ac),
                    ),
                  ),
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: Color(0xFF334f53),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
