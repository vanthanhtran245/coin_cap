import 'package:flutter/material.dart';
import 'package:coin_cap/helper/base_list_view.dart';
import 'package:coin_cap/model/beer.dart';
import 'package:coin_cap/view/item/transaction_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import  'package:coin_cap/viewmodel/home_provider.dart';
import 'package:coin_cap/base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:dartin/dartin.dart';
import 'package:provide/provide.dart';
import 'package:coin_cap/model/transaction.dart';

class Home extends PageProvideNode {

  final String title;

  Home({this.title}) {
    final provider = inject<HomeProvide>(params: [title]);
    mProviders.provideValue(provider);
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return MyHomePage();
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin<MyHomePage> implements Presenter{
  List<TransactionItem> _transactions = <TransactionItem>[];
  WidgetAdapter<Beer> adapter;
  LoadingListView<Beer> listView;
  HomeProvide mProvide;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mProvide = Provide.value<HomeProvide>(context);
    loadCoin();
    return Scaffold(
      body: Center(
        child:  ListView.builder(
          itemCount: _transactions.length,
          itemBuilder: (context, index) => TransactionItemView(_transactions[index]),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  void loadCoin() async {
    final s = mProvide.loadTransactions().doOnListen(() {

    }).doOnDone(() {

    }).doOnCancel(() {
      print("======cancel======");
    }).listen((response) {
      //success
      setState(() {
        Transaction item = Transaction.map(response);
        _transactions.addAll(item.data);
      });

    }, onError: (e) {
      //error
    });
    mProvide.addSubscription(s);
  }

  Future<Stream<Beer>> getBeers() async {
    final String url = 'https://api.punkapi.com/v2/beers';

    final client = new http.Client();
    final streamedRest = await client.send(
        http.Request('get', Uri.parse(url))
    );

    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        .map((data) => Beer.fromJSON(data));
  }

  @override
  void onClick(String action) {
  }
}
