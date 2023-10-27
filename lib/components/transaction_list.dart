import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  const TransactionList(this._transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    Intl.defaultLocale = 'pt_BR';
    return Column(
      children: _transactions
          .map((tr) => Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    border:
                    Border.all(color: Colors.purple, width: 2)),
                padding: EdgeInsets.all(10),
                child: Text(
                  'R\$ ${tr.value.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      fontSize: 20),
                ),
              ),
              Column(
                children: [
                  Text(tr.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(DateFormat('d MMM y').format(tr.date),
                      style: TextStyle(color: Colors.grey))
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              )
            ],
          )))
          .toList(),
    );
  }
}
