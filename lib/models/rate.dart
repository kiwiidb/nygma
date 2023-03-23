class Rate {
  String? code;
  String? symbol;
  String? rate;
  double? rateFloat;
  int? rateCents;
  EUR? eur;

  Rate(
      {this.code,
      this.symbol,
      this.rate,
      this.rateFloat,
      this.rateCents,
      this.eur});

  Rate.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    symbol = json['symbol'];
    rate = json['rate'];
    rateFloat = json['rate_float'];
    rateCents = json['rate_cents'];
    eur = json['EUR'] != null ? EUR.fromJson(json['EUR']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['symbol'] = symbol;
    data['rate'] = rate;
    data['rate_float'] = rateFloat;
    data['rate_cents'] = rateCents;
    if (eur != null) {
      data['EUR'] = eur!.toJson();
    }
    return data;
  }
}

class EUR {
  String? code;
  String? symbol;
  String? rate;
  double? rateFloat;
  int? rateCents;

  EUR({this.code, this.symbol, this.rate, this.rateFloat, this.rateCents});

  EUR.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    symbol = json['symbol'];
    rate = json['rate'];
    rateFloat = json['rate_float'];
    rateCents = json['rate_cents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['symbol'] = symbol;
    data['rate'] = rate;
    data['rate_float'] = rateFloat;
    data['rate_cents'] = rateCents;
    return data;
  }
}
