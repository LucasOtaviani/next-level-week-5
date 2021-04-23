import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnswerWidget extends StatelessWidget {
  final Answer answer;

  final bool isSelected;
  final bool disabled;

  final VoidCallback onTap;

  AnswerWidget({required this.answer, required this.onTap, this.isSelected = false, this.disabled = false});

  Color get _selectedColorRight => answer.isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight => answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight => answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRight => answer.isRight ? AppColors.green : AppColors.red;
  
  TextStyle get _selectedTextStyleRight => answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  
  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(
                  color: isSelected ? _selectedBorderCardRight : AppColors.border,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    answer.title,
                    style: AppTextStyles.body,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color:  isSelected ? _selectedColorRight : AppColors.white,
                    borderRadius: BorderRadius.circular(90),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: isSelected ? _selectedBorderCardRight : AppColors.border,
                      ),
                    ),
                  ),
                  child: isSelected
                    ? answer.isRight 
                      ? Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.white,
                        )
                    : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}