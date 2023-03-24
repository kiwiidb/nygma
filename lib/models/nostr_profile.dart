class Profile {
  String? pubkey;
  String? name;
  String picture;
  String? about;
  String? nip05;
  String? lud16;
  bool sendSucces;

  Profile(
      {this.name,
      this.picture = "https://robohash.org/kwinten",
      this.pubkey,
      this.about,
      this.sendSucces = false,
      this.nip05,
      this.lud16});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      about: json['about'],
      picture: json['picture'] ?? 'https://robohash.org/kwinten',
      nip05: json['nip05'],
      lud16: json['lud16'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['picture'] = picture;
    data['about'] = about;
    data['nip05'] = nip05;
    data['lud16'] = lud16;
    return data;
  }
}
