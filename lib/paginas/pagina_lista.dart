import 'dart:html';

import 'package:flutter/material.dart';

final TextEditingController email_controle = TextEditingController();

class Pagina_Lista extends StatelessWidget {
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
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Adicione uma tarefa",
                        hintText: "Digite aqui"),
                  ),
                ),
                SizedBox(width: 7),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 192, 250),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ListView(
              shrinkWrap: true,
              children: const [
                ListTile(
                  title: Text("a ariani é fofa."),
                  subtitle: Text("Você concorda ?"),
                  leading: Icon(
                    Icons.question_mark,
                    size: 30,
                  ),
                ),
                ListTile(
                  title: Text(" a ariani é chatinha"),
                  subtitle: Text("Você concorda ?"),
                  leading: Icon(
                    Icons.question_mark,
                    size: 30,
                  ),
                ),
                ListTile(
                  title: Text(" a ariani é legal."),
                  subtitle: Text("Você concorda ?"),
                  leading: Icon(
                    Icons.question_mark,
                    size: 30,
                  ),
                ),
                ListTile(
                  title: Text(" a ariani é bravinha."),
                  subtitle: Text("Você concorda ?"),
                  leading: Icon(
                    Icons.question_mark,
                    size: 30,
                  ),
                ),
                ListTile(
                  title: Text(" a ariani é irritadinha."),
                  subtitle: Text("Você concorda ?"),
                  leading: Icon(
                    Icons.question_mark,
                    size: 30,
                  ),
                ),
              ],
            ),
            /* Text("Mestre Jedi Dieimes Nunes"),
            ElevatedButton(onPressed: () {}, child: Text("Clique aqui"),),*/
            Row(
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    labelText: "Você possui 0 tarefas pendentes",
                  ),
                )),
                SizedBox(width: 7),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 192, 250),
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
}
