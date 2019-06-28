import 'package:flutter/material.dart';
import 'package:coin_cap/view/item/transaction_item.dart';
import  'package:coin_cap/viewmodel/home_provider.dart';
import 'package:coin_cap/base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:dartin/dartin.dart';
import 'package:coin_cap/model/transaction.dart';
import 'package:coin_cap/di/app_module.dart';
import 'package:dio/dio.dart';


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

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> _transactions = <Transaction>[];
  var requestPage = 0;
  ScrollController controller;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
    loadCoin(requestPage);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    _transactions = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: new Stack(
        children: <Widget>[
          _buildListView(),
          _loader(),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildListView() {
    return RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: ListView.builder(
          itemCount: _transactions.length,
          controller: controller,
          itemBuilder: (context, index) =>
               TransactionItemView(_transactions[index]
              ),
        ));
  }

  Widget _loader() {
    if (requestPage == 0 && _transactions.isEmpty) {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return isLoading
        ? new Align(
      child: new Container(
        width: 30.0,
        height: 30.0,
        child: new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new Center(child: new CircularProgressIndicator())),
      ),
      alignment: FractionalOffset.bottomCenter,
    )
        : new SizedBox(
      width: 0.0,
      height: 0.0,
    );
  }

  Future<void> _refresh() async {
     _transactions.clear();
     requestPage = 0;
     isLoading = false;
     loadCoin(requestPage);
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      startLoader();
    }
  }

  void startLoader() {
    setState(() {
      requestPage ++;
      isLoading = !isLoading;
      loadCoin(requestPage);
    });
  }

  void loadCoin(int page) async {
    var response = await dio.get("coins/markets", queryParameters: buildRequest(page));
    if (page != 0) {
      isLoading = !isLoading;
    }
    try {
      var items = (response.data as List).map((f) => Transaction.fromJson(f));
      setState(() {
        _transactions.addAll(items);
      });
    } catch (error, _) {
      print(_handleError(error));
    }
  }

  Map<String, String> buildRequest(int page) {
    Map<String, String> queryParameters = {
      "page": "$page",
      "per_page": "50",
      "vs_currency": "USD",
      "sparkline" : "false"
    };
    return queryParameters;
  }

  String _handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
          "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
          "Received invalid status code: ${error.response.statusCode}";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
}
