import 'package:DevQuiz/challenge/widgets/answer/answer_widget_dart.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/widgets.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  QuizWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget("Possibilita a criação de aplicativos compilados nativamente"),
          AnswerWidget("Possibilita a criação de aplicativos compilados nativamente", isRight: true),
          AnswerWidget("Possibilita a criação de aplicativos compilados nativamente", isSelected: true),
          AnswerWidget("Possibilita a criação de aplicativos compilados nativamente", isRight: true, isSelected: true,),
        ],
      ),
    );
  }
}