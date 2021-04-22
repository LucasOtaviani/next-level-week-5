import 'dart:convert';

class User {
  final String name;
  final String photo;
  final int score;

  User({
    required this.name,
    required this.photo,
    this.score = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
      'score': score,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      photo: map['photo'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}