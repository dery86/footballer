class League {
  int? id;
  String? name;
  String? country;
  String? logo;
  int? season;
  String? round;

  League(
      {this.id,
        this.name,
        this.country,
        this.logo,
        this.season,
        this.round});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    season = json['season'];
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country'] = country;
    data['logo'] = logo;
    data['season'] = season;
    data['round'] = round;
    return data;
  }
}