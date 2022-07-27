import 'package:flutter/material.dart';
import 'package:personal_expense_app/widgets/transaction_item.dart';
import 'package:google_fonts/google_fonts.dart';
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
       Text(
       'No transactions added yet!..............??!..',
         style: GoogleFonts.poppins(color: Colors.redAccent),
    ),
    SizedBox(
    height: 20,
    ),
    Container(
    height: 200,
    child: Image.asset(
    'asset/images/mr-bean.gif',
    fit: BoxFit.cover,
    )),
    ],
    ): Container(
     height: 700,
        child:
          ListView.builder(
     itemCount: transactions.length,
      itemBuilder: (context,index) {
      return TransactionItem(
         key: ValueKey(transactions[index].id),
         transaction: transactions[index],
         deleteTx: deleteTx,
       );

      },
    )));
  }
}

