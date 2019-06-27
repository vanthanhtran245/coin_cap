/// status : {"timestamp":"2019-06-27T14:13:07.278Z","error_code":0,"error_message":null,"elapsed":13,"credit_count":1}
/// data : [{"id":1,"name":"Bitcoin","symbol":"BTC","slug":"bitcoin","circulating_supply":17783500,"total_supply":17783500,"max_supply":21000000,"date_added":"2013-04-28T00:00:00.000Z","num_market_pairs":7639,"tags":["mineable"],"platform":null,"cmc_rank":1,"last_updated":"2019-06-27T14:12:27.000Z","quote":{"USD":{"price":11509.0884521,"volume_24h":43393823378.6065,"percent_change_1h":-2.01378,"percent_change_24h":-10.3013,"percent_change_7d":23.5367,"market_cap":204671874487.92035,"last_updated":"2019-06-27T14:12:27.000Z"}}}]

class Transaction {
  StatusBean _status;
  List<TransactionItem> _data;

  StatusBean get status => _status;
  List<TransactionItem> get data => _data;

  Transaction(this._status, this._data);

  Transaction.map(dynamic obj) {
    this._status = obj["status"];
    this._data = obj["data"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["status"] = _status;
    map["data"] = _data;
    return map;
  }

}

/// id : 1
/// name : "Bitcoin"
/// symbol : "BTC"
/// slug : "bitcoin"
/// circulating_supply : 17783500
/// total_supply : 17783500
/// max_supply : 21000000
/// date_added : "2013-04-28T00:00:00.000Z"
/// num_market_pairs : 7639
/// tags : ["mineable"]
/// platform : null
/// cmc_rank : 1
/// last_updated : "2019-06-27T14:12:27.000Z"
/// quote : {"USD":{"price":11509.0884521,"volume_24h":43393823378.6065,"percent_change_1h":-2.01378,"percent_change_24h":-10.3013,"percent_change_7d":23.5367,"market_cap":204671874487.92035,"last_updated":"2019-06-27T14:12:27.000Z"}}

class TransactionItem {
  int _id;
  String _name;
  String _symbol;
  String _slug;
  int _circulatingSupply;
  int _totalSupply;
  int _maxSupply;
  String _dateAdded;
  int _numMarketPairs;
  List<String> _tags;
  dynamic _platform;
  int _cmcRank;
  String _lastUpdated;
  QuoteBean _quote;

  int get id => _id;
  String get name => _name;
  String get symbol => _symbol;
  String get slug => _slug;
  int get circulatingSupply => _circulatingSupply;
  int get totalSupply => _totalSupply;
  int get maxSupply => _maxSupply;
  String get dateAdded => _dateAdded;
  int get numMarketPairs => _numMarketPairs;
  List<String> get tags => _tags;
  dynamic get platform => _platform;
  int get cmcRank => _cmcRank;
  String get lastUpdated => _lastUpdated;
  QuoteBean get quote => _quote;

  TransactionItem(this._id, this._name, this._symbol, this._slug, this._circulatingSupply, this._totalSupply, this._maxSupply, this._dateAdded, this._numMarketPairs, this._tags, this._platform, this._cmcRank, this._lastUpdated, this._quote);

  TransactionItem.map(dynamic obj) {
    this._id = obj["id"];
    this._name = obj["name"];
    this._symbol = obj["symbol"];
    this._slug = obj["slug"];
    this._circulatingSupply = obj["circulatingSupply"];
    this._totalSupply = obj["totalSupply"];
    this._maxSupply = obj["maxSupply"];
    this._dateAdded = obj["dateAdded"];
    this._numMarketPairs = obj["numMarketPairs"];
    this._tags = obj["tags"];
    this._platform = obj["platform"];
    this._cmcRank = obj["cmcRank"];
    this._lastUpdated = obj["lastUpdated"];
    this._quote = obj["quote"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["name"] = _name;
    map["symbol"] = _symbol;
    map["slug"] = _slug;
    map["circulatingSupply"] = _circulatingSupply;
    map["totalSupply"] = _totalSupply;
    map["maxSupply"] = _maxSupply;
    map["dateAdded"] = _dateAdded;
    map["numMarketPairs"] = _numMarketPairs;
    map["tags"] = _tags;
    map["platform"] = _platform;
    map["cmcRank"] = _cmcRank;
    map["lastUpdated"] = _lastUpdated;
    map["quote"] = _quote;
    return map;
  }

}

/// USD : {"price":11509.0884521,"volume_24h":43393823378.6065,"percent_change_1h":-2.01378,"percent_change_24h":-10.3013,"percent_change_7d":23.5367,"market_cap":204671874487.92035,"last_updated":"2019-06-27T14:12:27.000Z"}

class QuoteBean {
  USDBean _USD;

  USDBean get USD => _USD;

  QuoteBean(this._USD);

  QuoteBean.map(dynamic obj) {
    this._USD = obj["USD"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["USD"] = _USD;
    return map;
  }

}

/// price : 11509.0884521
/// volume_24h : 43393823378.6065
/// percent_change_1h : -2.01378
/// percent_change_24h : -10.3013
/// percent_change_7d : 23.5367
/// market_cap : 204671874487.92035
/// last_updated : "2019-06-27T14:12:27.000Z"

class USDBean {
  double _price;
  double _volume24h;
  double _percentChange1h;
  double _percentChange24h;
  double _percentChange7d;
  double _marketCap;
  String _lastUpdated;

  double get price => _price;
  double get volume24h => _volume24h;
  double get percentChange1h => _percentChange1h;
  double get percentChange24h => _percentChange24h;
  double get percentChange7d => _percentChange7d;
  double get marketCap => _marketCap;
  String get lastUpdated => _lastUpdated;

  USDBean(this._price, this._volume24h, this._percentChange1h, this._percentChange24h, this._percentChange7d, this._marketCap, this._lastUpdated);

  USDBean.map(dynamic obj) {
    this._price = obj["price"];
    this._volume24h = obj["volume24h"];
    this._percentChange1h = obj["percentChange1h"];
    this._percentChange24h = obj["percentChange24h"];
    this._percentChange7d = obj["percentChange7d"];
    this._marketCap = obj["marketCap"];
    this._lastUpdated = obj["lastUpdated"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["price"] = _price;
    map["volume24h"] = _volume24h;
    map["percentChange1h"] = _percentChange1h;
    map["percentChange24h"] = _percentChange24h;
    map["percentChange7d"] = _percentChange7d;
    map["marketCap"] = _marketCap;
    map["lastUpdated"] = _lastUpdated;
    return map;
  }

}

/// timestamp : "2019-06-27T14:13:07.278Z"
/// error_code : 0
/// error_message : null
/// elapsed : 13
/// credit_count : 1

class StatusBean {
  String _timestamp;
  int _errorCode;
  dynamic _errorMessage;
  int _elapsed;
  int _creditCount;

  String get timestamp => _timestamp;
  int get errorCode => _errorCode;
  dynamic get errorMessage => _errorMessage;
  int get elapsed => _elapsed;
  int get creditCount => _creditCount;

  StatusBean(this._timestamp, this._errorCode, this._errorMessage, this._elapsed, this._creditCount);

  StatusBean.map(dynamic obj) {
    this._timestamp = obj["timestamp"];
    this._errorCode = obj["errorCode"];
    this._errorMessage = obj["errorMessage"];
    this._elapsed = obj["elapsed"];
    this._creditCount = obj["creditCount"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["timestamp"] = _timestamp;
    map["errorCode"] = _errorCode;
    map["errorMessage"] = _errorMessage;
    map["elapsed"] = _elapsed;
    map["creditCount"] = _creditCount;
    return map;
  }

}