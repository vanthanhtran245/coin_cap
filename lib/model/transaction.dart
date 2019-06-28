class Transaction  {
  String id;
  String symbol;
  String name;
  String image;
  num totalSupply;
  String athDate;
  String roi;
  String lastUpdated;
  num currentPrice;
  num high24h;
  num low24h;
  num priceChange24h;
  num priceChangePercentage24h;
  num marketCapChange24h;
  num marketCapChangePercentage24h;
  num ath;
  num athChangePercentage;
  num marketCap;
  num marketCapRank;
  num totalVolume;
  num circulatingSupply;

  Transaction({this.id, this.symbol, this.name, this.image, this.totalSupply, this.athDate, this.roi, this.lastUpdated, this.currentPrice, this.high24h, this.low24h, this.priceChange24h, this.priceChangePercentage24h, this.marketCapChange24h, this.marketCapChangePercentage24h, this.ath, this.athChangePercentage, this.marketCap, this.marketCapRank, this.totalVolume, this.circulatingSupply});

  Transaction.fromJson(Map<String, dynamic> json) {    
    this.id = json['id'];
    this.symbol = json['symbol'];
    this.name = json['name'];
    this.image = json['image'];
    this.totalSupply = json['total_supply'];
    this.athDate = json['ath_date'];
    this.roi = json['roi'].toString();
    this.lastUpdated = json['last_updated'];
    this.currentPrice = json['current_price'];
    this.high24h = json['high_24h'];
    this.low24h = json['low_24h'];
    this.priceChange24h = json['price_change_24h'];
    this.priceChangePercentage24h = json['price_change_percentage_24h'];
    this.marketCapChange24h = json['market_cap_change_24h'];
    this.marketCapChangePercentage24h = json['market_cap_change_percentage_24h'];
    this.ath = json['ath'];
    this.athChangePercentage = json['ath_change_percentage'];
    this.marketCap = json['market_cap'];
    this.marketCapRank = json['market_cap_rank'];
    this.totalVolume = json['total_volume'];
    this.circulatingSupply = json['circulating_supply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['image'] = this.image;
    data['total_supply'] = this.totalSupply;
    data['ath_date'] = this.athDate;
    data['roi'] = this.roi.toString();
    data['last_updated'] = this.lastUpdated;
    data['current_price'] = this.currentPrice;
    data['high_24h'] = this.high24h;
    data['low_24h'] = this.low24h;
    data['price_change_24h'] = this.priceChange24h;
    data['price_change_percentage_24h'] = this.priceChangePercentage24h;
    data['market_cap_change_24h'] = this.marketCapChange24h;
    data['market_cap_change_percentage_24h'] = this.marketCapChangePercentage24h;
    data['ath'] = this.ath;
    data['ath_change_percentage'] = this.athChangePercentage;
    data['market_cap'] = this.marketCap;
    data['market_cap_rank'] = this.marketCapRank;
    data['total_volume'] = this.totalVolume;
    data['circulating_supply'] = this.circulatingSupply;
    return data;
  }
}
