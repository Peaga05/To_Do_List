import 'package:flutter/material.dart';
import 'package:to_do_list/pages/cadastrar_tarefas.dart';
import 'package:to_do_list/pages/listar_tarefas.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int paginaAtual = 0;
  late PageController index;

  @override
  void initState() {
    super.initState();
    index = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: index,
        onPageChanged: setPaginaAtual,
        children: const [
          ListarTarefas(),
          CadastrarTarefas(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFe1e3ac),
        currentIndex: paginaAtual,
        unselectedItemColor: const Color(0xFF334f53),
        selectedItemColor: const Color(0xFF45936c),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Tarefas"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Adicionar tarefa",
          )
        ],
        onTap: (pagina) {
          index.animateToPage(pagina,
              duration: const Duration(microseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
