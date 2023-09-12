import 'package:app_lista_tarefas/modelo/objeto_data_hora.dart';
import 'package:app_lista_tarefas/repositorio/repositorio.dart';
import 'package:flutter/material.dart';

import '../widgets/itens_lista.dart';

final TextEditingController email_controle = TextEditingController();

class Pagina_Lista extends StatefulWidget {
  @override
  State<Pagina_Lista> createState() => _Pagina_ListaState();
}

class _Pagina_ListaState extends State<Pagina_Lista> {
  final TextEditingController mensagensControlador = TextEditingController();
  final Repositorio objeto_repositorio = Repositorio();

  List<Data_Hora> Mensagens = [];
  Data_Hora? deletar_itens;
  int? posicao_atual_deletar;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: mensagensControlador,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Adicione uma tarefa",
                        hintText: "Digite aqui"),
                  ),
                ),
                SizedBox(width: 7),
                ElevatedButton(
                  onPressed: () {
                    String qualquercoisa = mensagensControlador.text;
                    setState(() {
                      Data_Hora item_data_hora = Data_Hora(
                          titulo: qualquercoisa, data_hora: DateTime.now());
                      Mensagens.add(item_data_hora);
                    });
                    objeto_repositorio.salvarLista(Mensagens);
                    mensagensControlador.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(204, 125, 14, 243),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 320,
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (Data_Hora mensagem_controle in Mensagens)
                    tudoItemLista(
                      mensagem_data_hora: mensagem_controle,
                      item_deletar_tarefas: deletar_tarefas,
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    labelText:
                        "Você possui ${Mensagens.length} tarefas pendentes",
                  ),
                )),
                SizedBox(width: 7),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Mensagens.clear();
                      mensagem_confirmacao();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(204, 125, 14, 243),
                  ),
                  child: Text("Limpar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void deletar_tarefas(Data_Hora item_data_hora) {
    deletar_itens = item_data_hora;
    posicao_atual_deletar = Mensagens.indexOf(item_data_hora);
    setState(() {
      Mensagens.remove(item_data_hora);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Tarefa ${item_data_hora.titulo} foi removida com sucesso",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(204, 125, 14, 243),
        action: SnackBarAction(
          label: "Desfazer",
          onPressed: () {
            setState(() {
              Mensagens.insert(posicao_atual_deletar!, deletar_itens!);
            });
          },
        ),
      ),
    );
  }

  void mensagem_confirmacao() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Limpar tudo?"),
          content:
              Text("Você tem certeza que deseja apagar todas as tarefas? "),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  Mensagens.clear();
                  Navigator.pop(context);
                });
              },
              child: Text("Limpar tudo"),
            ),
          ],
        );
      },
    );
  }
}
