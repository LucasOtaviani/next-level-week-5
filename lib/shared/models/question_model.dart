import 'dart:convert';

import 'package:DevQuiz/shared/models/answer_model.dart';

class Question {
  final String title;
  final List<Answer> answers;

  Question({required this.title, required this.answers}) : assert(answers.length == 4);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': answers.map((answer) => answer.toMap()).toList(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      title: map['title'],
      answers: List<Answer>.from(map['answers']?.map((answer) => Answer.fromMap(answer))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source));
}