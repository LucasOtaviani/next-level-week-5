import 'dart:convert';

class Answer {
  final String title;
  final bool isRight;

  Answer({required this.title, this.isRight = false});
    
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isRight': isRight,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      title: map['title'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) => Answer.fromMap(json.decode(source));
}
