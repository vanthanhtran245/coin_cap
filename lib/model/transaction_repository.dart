import 'package:rxdart/rxdart.dart';
import 'package:coin_cap/di/network/network_utils.dart';


class TransactionService {
  var queryParameters = {
    "start": "1",
    "limit": "5000",
    "convert": "USD"
  };
  Observable loadTransaction() => get("cryptocurrency/listings/latest" );
}

class TransactionRepo {
  final TransactionService _service;
  TransactionRepo(this._service);

  Observable loadTransaction() {
    return _service.loadTransaction();
  }
}