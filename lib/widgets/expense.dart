import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/widgets/new_budget.dart';

import '../models/transaction.dart';

class Expense extends StatefulWidget {
  final List<Transaction> recentTransactions;

  const Expense({
    Key? key,
    required this.recentTransactions,
  }) : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  void initState() {
    super.initState();
  }

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < widget.recentTransactions.length; i++) {
        if (widget.recentTransactions[i].date.day == weekDay.day &&
            widget.recentTransactions[i].date.month == weekDay.month &&
            widget.recentTransactions[i].date.year == weekDay.year) {
          totalSum += widget.recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  double budget = 0.0;
  void getBudget(double bud) {
    setState(() {
      budget = bud;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/images/crown.png'),
          opacity: 0.5,
        ),
      ),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(
                  '₹ $budget',
                  style: TextStyle(fontSize: 35, color: Colors.green),
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return GestureDetector(
                            onTap: () {},
                            child: NewBudget(getBudget),
                            behavior: HitTestBehavior.opaque,
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 15,
                    )),
              ],
            ),
            Text(
              '₹ $totalSpending',
              style: TextStyle(fontSize: 35, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
