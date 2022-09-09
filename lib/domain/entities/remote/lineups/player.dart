
class Player {
  int? id;
  String? name;
  int? number;

  Player({this.id, this.name, this.number, });

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['number'] = number;
    return data;
  }
}