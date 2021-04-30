import 'dart:convert';

class Monster {
  final int id;
  final String name;
  final String location;
  final String element;
  final String ailment;
  final String quest;
  final String weakness;
  final String weakness_img;
  final String img_asset;
  final String background_img;
  final String description;

  const Monster({
    this.id,
    this.name,
    this.location,
    this.element,
    this.ailment,
    this.quest,
    this.weakness,
    this.weakness_img,
    this.img_asset,
    this.background_img,
    this.description,
  });

  factory Monster.fromJson(String str) => Monster.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Monster.fromMap(Map<String, dynamic> json) => Monster(
        id: (json["id"] is int) ? json["id"] : int.parse(json["id"]),
        name: json["name"],
        location: json["location"],
        element: json["element"],
        ailment: json["ailment"],
        quest: json["quest"],
        weakness: json["weakness"],
        weakness_img: json["weakness_img"],
        img_asset: json["img_asset"],
        background_img: json["background_img"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "location": location,
        "element": element,
        "ailment": ailment,
        "quest": quest,
        "weakness": weakness,
        "weakness_img": weakness_img,
        "img_asset": img_asset,
        "background_img": background_img,
        "description": description
      };
}

List<Monster> monsters = [];
