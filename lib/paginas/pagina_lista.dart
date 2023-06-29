import 'package:flutter/material.dart';

final TextEditingController email_controle = TextEditingController();

class Pagina_lista extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Adicione uma tarefa",
                    hintText: "digite aqui"),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("*"))
          ],
        ),
      ),
    );
  }
}

void entrar() {
  String texto = email_controle.text;
  print(texto);
  email_controle.clear();
}
