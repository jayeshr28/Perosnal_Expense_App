import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_expense_app/widgets/adding_trans.dart';
import 'package:personal_expense_app/widgets/analytics_card.dart';
import 'package:personal_expense_app/widgets/expense.dart';
import 'package:personal_expense_app/widgets/transaction_list.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [];

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff1fa),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 29),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Expenses",
                    style: GoogleFonts.heebo(
                        textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  IconButton(
                      onPressed: () {
                        _startAddNewTransaction(context);
                      },
                      icon: Icon(CupertinoIcons.add))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "This month Budget",
                    style:
                        GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                  ).py16(),
                  Text(
                    "This month spend",
                    style:
                        GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                  ).py16(),
                ],
              ),
              Expense(
                recentTransactions: _recentTransactions,
              ),
              Analytics(
                recentTransactions: _recentTransactions,
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   height: 100,
              //   padding: const EdgeInsets.all(10),
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //       color: Colors.lightGreenAccent,
              //       borderRadius: BorderRadius.circular(20)),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Text(
              //         "Budget",
              //         style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
              //       ),
              //     ],
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Transactions",
                    style: GoogleFonts.heebo(
                        textStyle: TextStyle(fontSize: 18, color: Colors.grey)),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.chevron_down))
                ],
              ).pOnly(top: 16, right: 14, left: 14),
              TransactionList(_userTransactions, _deleteTransaction)
            ],
          ),
        ),
      ),
    );
  }
}
