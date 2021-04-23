import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int completed;
  final int questions;

  final VoidCallback onTap;

  QuizCardWidget({
    required this.title,
    required this.completed,
    required this.questions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.border,
            )
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(completed.toString() + " de " + questions.toString(), style: AppTextStyles.body11)
                ),
                Expanded(
                  flex: 3,
                  child: ProgressIndicatorWidget(completed/questions)
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}