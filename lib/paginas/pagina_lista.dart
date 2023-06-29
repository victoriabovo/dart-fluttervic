import 'package:flutter/material.dart';

final TextEditingController email_controle = TextEditingController();



class Pagina_lista extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: email_controle,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              ElevatedButton(onPressed: entrar, child:Text ("Entrar"))
            ],
          ),
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
