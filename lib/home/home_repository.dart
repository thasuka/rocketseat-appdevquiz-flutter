import 'dart:convert';

import 'package:DevQuiz/shared/models/User_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;

    final quizzes = list.map((quiz) => QuizModel.fromMap(quiz)).toList();
    return quizzes;
  }
}
