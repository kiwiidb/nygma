class Utxo {
  String? txid;
  int? vout;
  Status? status;
  int? value;

  Utxo({this.txid, this.vout, this.status, this.value});

  Utxo.fromJson(Map<String, dynamic> json) {
    txid = json['txid'];
    vout = json['vout'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['txid'] = this.txid;
    data['vout'] = this.vout;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['value'] = this.value;
    return data;
  }
}

class Status {
  bool? confirmed;
  int? blockHeight;
  String? blockHash;
  int? blockTime;

  Status({this.confirmed, this.blockHeight, this.blockHash, this.blockTime});

  Status.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    blockHeight = json['block_height'];
    blockHash = json['block_hash'];
    blockTime = json['block_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = this.confirmed;
    data['block_height'] = this.blockHeight;
    data['block_hash'] = this.blockHash;
    data['block_time'] = this.blockTime;
    return data;
  }
}
