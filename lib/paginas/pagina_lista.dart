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
}
