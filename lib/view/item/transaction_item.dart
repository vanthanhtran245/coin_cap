import 'package:flutter/material.dart';
import 'package:coin_cap/model/transaction.dart';

class TransactionItemView extends BaseWidgetAdapter<Transaction> {
  final Transaction _item;
  TransactionItemView(this._item);

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
    },
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text(_item.name),
          subtitle: Text(_item.currentPrice.toString()),
          leading: Container(
              margin: EdgeInsets.only(left: 6.0),
              child: Image.network(_item.image, height: 50.0, fit: BoxFit.fill)
          ),
        ),
        Divider()
      ],
    ),
  );
}

abstract class BaseWidgetAdapter<T> extends StatelessWidget {}