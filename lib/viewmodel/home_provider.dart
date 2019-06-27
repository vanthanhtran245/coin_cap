import 'package:dio/dio.dart';
import 'package:coin_cap/model/transaction_repository.dart';
import 'package:coin_cap/base/base.dart';
import 'package:rxdart/rxdart.dart';
import 'package:coin_cap/model/transaction.dart';

class HomeProvide extends BaseProvide {
  final TransactionRepo _repo;

  Transaction _response;
  final String title;
  Transaction get response => _response;

  set response(Transaction response) {
    _response = response;
    notifyListeners();
  }

  HomeProvide(this.title, this._repo);

  Observable loadTransactions() => _repo
      .loadTransaction()
      .doOnData( (r) => response = Transaction.map(r))
      .doOnError((e, stacktrace) {
        if (e is DioError) {
          print(e.message);
        }
    });
}
