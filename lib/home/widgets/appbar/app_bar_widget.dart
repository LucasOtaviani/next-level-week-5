import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/widgets/appbar/score_card/score_card_widget.dart';
import 'package:flutter/widgets.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget() : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 161,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(gradient: AppGradients.linear),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                  text: "Olá, ",
                  style: AppTextStyles.title,
                  children: [
                    TextSpan(
                      text: "Lucas Otaviani!"
                    )
                  ]
                )),
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: NetworkImage("https://avatars.githubusercontent.com/u/47718917?s=400&u=a2acd88205b0c639b7054c7f73086e901500f50b&v=4"))
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: ScoreCardWidget(),
          )
        ],
      ),
    ),
  );
}
