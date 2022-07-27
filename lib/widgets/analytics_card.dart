import 'package:flutter/material.dart';
import 'package:personal_expense_app/widgets/chart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/transaction.dart';
import 'adding_trans.dart';

class Analytics extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Analytics({Key? key,required this.recentTransactions}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),

            ).pOnly(top: 10),
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ],
        ),

        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Analytics",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),),
                SizedBox(width: 150,),
                Text("This Week", style: TextStyle(color: Colors.grey),).px4(),
                Icon(Icons.access_alarm, color: Colors.white60,size: 18,)
              ],
            ).pOnly(top: 30, left: 20, right: 20, bottom: 17),

            Chart(recentTransactions)
          ],
        )


      ],
    );
  }
}
