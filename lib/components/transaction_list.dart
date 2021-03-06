import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onDelete;

  TransactionList(this.transactions, this.onDelete);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Nenhuma transação cadastrada',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets\\images\\waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final item = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(item),
                item: item,
                onDelete: onDelete,
              );
            },
          );
    // ListView(
    //     children: transactions.map((item) {
    //       return TransactionItem(
    //         item: item,
    //         onDelete: onDelete,
    //         key: ValueKey(item.id),
    //       );
    //     }).toList(),
    //   );
  }
}
