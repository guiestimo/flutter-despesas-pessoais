import 'dart:math';

import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction item;
  final void Function(String) onDelete;

  const TransactionItem({
    Key key,
    @required this.item,
    @required this.onDelete,
  }) : super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  // Itens comentados a fins de teste de cores randomicas e manter a chave do item da lista
  // static const colors = [
  //   Colors.red,
  //   Colors.purple,
  //   Colors.orange,
  //   Colors.blue,
  //   Colors.black
  // ];

  // Color _backgroundColor;

  // @override
  // void initState() {
  //   super.initState();

  //   int i = Random().nextInt(5);
  //   _backgroundColor = colors[i];
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor, //_backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                NumberFormat.simpleCurrency(locale: 'pt_BR')
                    .format(widget.item.value),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          widget.item.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MMM y', "pt_BR").format(widget.item.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
                onPressed: () => widget.onDelete(widget.item.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).errorColor),
                ),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.onDelete(widget.item.id),
              ),
      ),
    );
  }
}
