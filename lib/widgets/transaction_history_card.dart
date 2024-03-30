import 'package:cash_swift/data/month_list.dart';
import 'package:cash_swift/data/weekday_list.dart';
import 'package:cash_swift/models/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:profile_photo/profile_photo.dart';

class TransactionHistoryCard extends StatelessWidget {
  final TransactionHistory transactionHistory;

  const TransactionHistoryCard({super.key, required this.transactionHistory});

  double mq(BuildContext context, double size) {
    return MediaQuery.of(context).size.height * (size / 1000);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        print(DateTime.now().toLocal());
      },
      child: Container(
        margin: EdgeInsets.all(mq(context, 10)),
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: mq(context, 20), horizontal: mq(context, 5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfilePhoto(
                  totalWidth: mq(context, 70),
                  cornerRadius: mq(context, 100),
                  color: Colors.purple,
                  name: transactionHistory.name,
                  nameDisplayOption: NameDisplayOptions.initials,
                ),
                FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        transactionHistory.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        "${transactionHistory.time}, ${transactionHistory.date} ${monthList[transactionHistory.month]} ${transactionHistory.year}",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(transactionHistory.amount,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.black)),
                    transactionHistory.categoryIcon
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
