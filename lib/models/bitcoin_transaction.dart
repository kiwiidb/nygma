class BitcoinTransaction {
  String? txid;
  int? version;
  int? locktime;
  List<Vin>? vin;
  List<Vout>? vout;
  int? size;
  int? weight;
  int? fee;
  Status? status;

  BitcoinTransaction(
      {this.txid,
      this.version,
      this.locktime,
      this.vin,
      this.vout,
      this.size,
      this.weight,
      this.fee,
      this.status});

  BitcoinTransaction.fromJson(Map<String, dynamic> json) {
    txid = json['txid'];
    version = json['version'];
    locktime = json['locktime'];
    if (json['vin'] != null) {
      vin = <Vin>[];
      json['vin'].forEach((v) {
        vin!.add(new Vin.fromJson(v));
      });
    }
    if (json['vout'] != null) {
      vout = <Vout>[];
      json['vout'].forEach((v) {
        vout!.add(new Vout.fromJson(v));
      });
    }
    size = json['size'];
    weight = json['weight'];
    fee = json['fee'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['txid'] = this.txid;
    data['version'] = this.version;
    data['locktime'] = this.locktime;
    if (this.vin != null) {
      data['vin'] = this.vin!.map((v) => v.toJson()).toList();
    }
    if (this.vout != null) {
      data['vout'] = this.vout!.map((v) => v.toJson()).toList();
    }
    data['size'] = this.size;
    data['weight'] = this.weight;
    data['fee'] = this.fee;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Vin {
  String? txid;
  int? vout;
  Vout? prevout;
  String? scriptsig;
  String? scriptsigAsm;
  List<String>? witness;
  bool? isCoinbase;
  int? sequence;

  Vin(
      {this.txid,
      this.vout,
      this.prevout,
      this.scriptsig,
      this.scriptsigAsm,
      this.witness,
      this.isCoinbase,
      this.sequence});

  Vin.fromJson(Map<String, dynamic> json) {
    txid = json['txid'];
    vout = json['vout'];
    prevout =
        json['prevout'] != null ? new Vout.fromJson(json['prevout']) : null;
    scriptsig = json['scriptsig'];
    scriptsigAsm = json['scriptsig_asm'];
    witness = json['witness'].cast<String>();
    isCoinbase = json['is_coinbase'];
    sequence = json['sequence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['txid'] = this.txid;
    data['vout'] = this.vout;
    if (this.prevout != null) {
      data['prevout'] = this.prevout!.toJson();
    }
    data['scriptsig'] = this.scriptsig;
    data['scriptsig_asm'] = this.scriptsigAsm;
    data['witness'] = this.witness;
    data['is_coinbase'] = this.isCoinbase;
    data['sequence'] = this.sequence;
    return data;
  }
}

class Vout {
  String? scriptpubkey;
  String? scriptpubkeyAsm;
  String? scriptpubkeyType;
  String? scriptpubkeyAddress;
  int? value;

  Vout(
      {this.scriptpubkey,
      this.scriptpubkeyAsm,
      this.scriptpubkeyType,
      this.scriptpubkeyAddress,
      this.value});

  Vout.fromJson(Map<String, dynamic> json) {
    scriptpubkey = json['scriptpubkey'];
    scriptpubkeyAsm = json['scriptpubkey_asm'];
    scriptpubkeyType = json['scriptpubkey_type'];
    scriptpubkeyAddress = json['scriptpubkey_address'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scriptpubkey'] = this.scriptpubkey;
    data['scriptpubkey_asm'] = this.scriptpubkeyAsm;
    data['scriptpubkey_type'] = this.scriptpubkeyType;
    data['scriptpubkey_address'] = this.scriptpubkeyAddress;
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
