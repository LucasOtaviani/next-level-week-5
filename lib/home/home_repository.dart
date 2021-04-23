import 'dart:convert';

import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<User> getUser() async {
    final response = await rootBundle.loadString("database/user.json");

    return User.fromJson(response);
  }

  Future<List<Quiz>> getQuizzes() async {
    final response = await rootBundle.loadString("database/quizzes.json");
    final list = jsonDecode(response) as List;

    return list.map((quiz) => Quiz.fromMap(quiz)).toList();
  }
}