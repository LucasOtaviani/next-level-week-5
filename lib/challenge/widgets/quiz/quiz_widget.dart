import 'package:DevQuiz/challenge/widgets/answer/answer_widget_dart.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/widgets.dart';

class QuizWidget extends StatefulWidget {
  final Question question;
  final VoidCallback onChange;

  QuizWidget({required this.question, required this.onChange});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? selectedIndex = -1;

  Answer answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.answers.length; i++) 
            AnswerWidget(
              answer: answer(i),
              isSelected: selectedIndex == i,
              disabled: selectedIndex != -1,
              onTap: () {
                selectedIndex = i;

                setState(() {});

                Future.delayed(Duration(seconds: 1)).then((value) => widget.onChange());
              },
            ),
        ],
      ),
    );
  }
}