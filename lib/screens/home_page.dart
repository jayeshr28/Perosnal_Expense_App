import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_expense_app/widgets/adding_trans.dart';
import 'package:personal_expense_app/widgets/analytics_card.dart';
import 'package:personal_expense_app/widgets/bottom_bar.dart';
import 'package:personal_expense_app/widgets/expense.dart';
import 'package:personal_expense_app/widgets/routes.dart';
import 'package:personal_expense_app/widgets/transaction_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
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
                    "Home",
                    style: GoogleFonts.heebo(
                        textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.bell))
                ],
              ),
              Text(
                "This month spend",
                style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
              ).py16(),

              Expense(
                recentTransactions: _recentTransactions,
              ),

              Analytics(recentTransactions: _recentTransactions,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Transactions",
                    style: GoogleFonts.heebo(
                        textStyle:
                            TextStyle(fontSize: 18, color: Colors.grey)),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.chevron_down))
                ],
              ).pOnly(top: 16, right: 14, left: 14),





            TransactionList(_userTransactions, _deleteTransaction)







            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: (){ _startAddNewTransaction(context);},
        child: Container(
          width: 152,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blue,
          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Add Transaction", style: GoogleFonts.nunito(),).pOnly(left: 10),
              IconButton(icon: Icon(Icons.add), onPressed: () {},
          ),],),
        ).px8(),
      ),
    );
  }
}
