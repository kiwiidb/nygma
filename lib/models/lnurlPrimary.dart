class LnUrlPrimary {
  String? callback;
  int? maxSendable;
  int? minSendable;
  String? metadata;
  String? tag;

  LnUrlPrimary(
      {this.callback,
      this.maxSendable,
      this.minSendable,
      this.metadata,
      this.tag});

  LnUrlPrimary.fromJson(Map<String, dynamic> json) {
    callback = json['callback'];
    maxSendable = json['maxSendable'];
    minSendable = json['minSendable'];
    metadata = json['metadata'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['callback'] = this.callback;
    data['maxSendable'] = this.maxSendable;
    data['minSendable'] = this.minSendable;
    data['metadata'] = this.metadata;
    data['tag'] = this.tag;
    return data;
  }
}
