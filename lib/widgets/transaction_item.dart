import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.black,
              margin: const EdgeInsets.all(5),
              elevation: 0,
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "asset/images/down_dollar.png",
                    height: 50,
                    width: 50,
                    color: Colors.white,
                  )),
            ),
          ),
          title: Text(
            widget.transaction.title,
            style: GoogleFonts.poppins(
              fontSize: 17,
            ),
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(widget.transaction.date),
          ),
          trailing: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '₹ ${widget.transaction.amount}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => widget.deleteTx(widget.transaction.id),
                )
              ],
            ),
          ),
        ));
  }
}
