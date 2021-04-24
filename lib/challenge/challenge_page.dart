import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/quention_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChallengePage extends StatefulWidget {
  final List<Question> questions;
  final String title;

  ChallengePage({required this.questions, required this.title});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final challengeController = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      challengeController.currentPage = pageController.page!.toInt();
    });

    super.initState();
  }

  void nextPage() {
    pageController.nextPage(duration: Duration(milliseconds: 450), curve: Curves.easeInOut);
  }

  void onSelected(bool value) {
    if (value) {
      challengeController.rightAnswers++;
    }

    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: challengeController.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value + 1,
                  length: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions.map((question) => QuizWidget(question: question, onSelected: onSelected)).toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: challengeController.currentPageNotifier, 
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (value < widget.questions.length - 1)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: "Pular",
                      onPressed: nextPage
                    )
                  ),
                
                if (value == widget.questions.length - 1)
                  Expanded(
                    child: NextButtonWidget.green(
                      label: "Confirmar",
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              title: widget.title, 
                              length: widget.questions.length, 
                              answered: challengeController.rightAnswers,
                            )
                          )
                        );
                      }
                    )
                  ),
              ],
            )
          )
        ),
      ),
    );
  }
}