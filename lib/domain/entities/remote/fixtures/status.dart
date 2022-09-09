class Status {
  String? long;
  String? short;
  int? elapsed;

  Status({this.long, this.short, this.elapsed});

  Status.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    short = json['short'];
    elapsed = json['elapsed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['long'] = long;
    data['short'] = short;
    data['elapsed'] = elapsed;
    return data;
  }
}