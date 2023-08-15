import 'package:app_lista_tarefas/modelo/objeto_data_hora.dart';
import 'package:app_lista_tarefas/widgets/itens_lista.dart';
import 'package:flutter/material.dart';

class Pagina_lista extends StatefulWidget {
  @override
  State<Pagina_lista> createState() => _Pagina_listaState();
}

class _Pagina_listaState extends State<Pagina_lista> {
  final TextEditingController mensagensControlador = TextEditingController();

  List<Data_Hora> Mensagens = [];
  Data_Hora? deletar_itens;
  int? posicao_atual_deletar;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      String qualquercoisa = mensagensControlador.text;

                      setState(() {
                        Data_Hora item_data_hora = Data_Hora(
                            titulo: qualquercoisa, data_hora: DateTime.now());
                        Mensagens.add(
                            item_data_hora); // Adicionando valores na lista Mensagens
                      });

                      mensagensControlador.clear();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 175, 41, 41),
                        padding: EdgeInsets.all(20)),
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
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (Data_Hora item_data_hora in Mensagens)
                      tudoItemLista(
                        mensagem_data_hora: item_data_hora,
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
                    child: Text("Você possui 0 tarefas pendentes"),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 179, 12, 18),
                        padding: EdgeInsets.all(20)),
                    child: Text("Limpar"),
                  ),
                ],
              ),
            ],
          ),
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
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color.fromARGB(204, 75, 14, 20),
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
}
