import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_expense_app/widgets/transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      child: Lottie.asset("asset/lottie/empty.json")),
                ],
              )
            : Container(
                height: 700,
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionItem(
                      key: ValueKey(transactions[index].id),
                      transaction: transactions[index],
                      deleteTx: deleteTx,
                    );
                  },
                )));
  }
}
