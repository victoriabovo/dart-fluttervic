import 'package:app_lista_tarefas/modelo/objeto_data_hora.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
 

class tudoItemLista extends StatelessWidget {
  const tudoItemLista({super.key, required this.mensagem_data_hora});

  final Data_Hora mensagem_data_hora;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: null,
            backgroundColor: Color.fromARGB(255, 174, 50, 37),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Deletar',
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 190, 14, 64),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat("dd/MM/yyyy - HH:mm")
                      .format(mensagem_data_hora.data_hora),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  mensagem_data_hora.titulo,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
