class LnUrlSecondary {
  String? pr;

  LnUrlSecondary({required this.pr});

  LnUrlSecondary.fromJson(Map<String, dynamic> json) {
    pr = json['pr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pr'] = this.pr;
    return data;
  }
}
