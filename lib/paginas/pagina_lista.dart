import 'package:flutter/material.dart';

// final TextEditingController email_controle = TextEditingController();

class Pagina_Lista extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold è um Widget que fornece uma estrutura visual basica para um aplicativo
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
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Adicione uma tarefa",
                            hintText: "digite aqui"),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 114, 8, 128),
                          padding: EdgeInsets.all(20)),
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(" Você tem 0 tarefas pendentes"),
                    ),
                    SizedBox(
                      width: 8, /* Espaçamento entre o texto e o botão */
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 114, 8, 128),
                          padding: EdgeInsets.all(20)),
                      child: Text("Limpar"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ListView(),
                SizedBox(
                  height: 40,
                ),
              ],
            )),
      ),
    );
  }
}

/*
void entrar() {
  String texto = email_controle
      .text; //obtém o texto inserido no campo de entrada associado ao "controlar".
  print(texto);
  email_controle
      .clear(); //limpa o comapo de entrada,removendo qualquer texto atualmente presente nele.
}

*/

