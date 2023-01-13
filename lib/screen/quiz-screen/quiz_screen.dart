import 'dart:async';

import 'package:love_test_app/controller/quiz_controller.dart';
import 'package:love_test_app/general_widgets/background_image.dart';
import 'package:love_test_app/general_widgets/general_elevated_button.dart';
import 'package:love_test_app/model/quiz_model.dart';
import 'package:love_test_app/screen/call_screen/call_screen.dart';
import 'package:love_test_app/screen/home_screen/home_screen.dart';
import 'package:love_test_app/screen/quiz-screen/components/heading_text.dart';
import 'package:love_test_app/screen/result_screen/result_screen.dart';
import 'package:love_test_app/utils/all_utilities.dart';

class QuizScreen extends StatelessWidget {
  static const String routeName = 'quiz_screen';

  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)?.settings.arguments as int? ?? 0;
    return WillPopScope(
      onWillPop: () => QuizController.showExitPopUp(
          context: context,
          onPressedExit: () {
            QuizController.correctAnswers.clear();
            QuizController.resultValue = 0;
            QuizController.herName = '';
            QuizController.hisName = '';
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          },
          dialogText: 'Do you want to leave the Love test?'),
      child: BackgroundImage(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            HeadingText(
              headingText: QuizController.selectedQuiz[index].headingText,
            ),
            ...buildButton(QuizController.selectedQuiz[index].options, index),
            SizedBox(height: 70.h),
            Text('${index + 1}/10',
                style:
                    TextStyle(fontSize: 130.sp, fontWeight: FontWeight.bold)),
          ]),
        ),
      ),
    );
  }
}

class _BuildButton extends StatefulWidget {
  const _BuildButton({
    Key? key,
    required this.index,
    required this.text,
  }) : super(key: key);

  final int index;
  final String text;

  @override
  State<_BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<_BuildButton> {
  bool isCallScreenShowed = false;

  @override
  Widget build(BuildContext context) {
    final questions = QuizModel.quiz1;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 80.h),
      child: GeneralElevatedButton(
        buttonWidth: 250,
        fontColor: Colors.black,
        text: widget.text,
        onPressed: () {
          if (widget.index == 6 && !isCallScreenShowed) {
            isCallScreenShowed = true;
            Timer(Duration(milliseconds: 500), () {
              Navigator.pushNamed(context, CallScreen.routeName);
            });
            return;
          }
          if (widget.index >= questions.length - 1) {
            for (int i = 0; i < QuizController.correctAnswers.length - 1; i++) {
              if (QuizController.correctAnswers[i] == true) {
                QuizController.resultValue = QuizController.resultValue + 1.0;
              }
            }
            QuizController.resultValue =
                QuizController.resultValue.roundToDouble() / 10;
            if (QuizController.isAnswered == true) {
              QuizController.resultValue = QuizController.resultValue - 20.0;
            }
            if (QuizController.resultValue <= 0) {
              QuizController.resultValue = 0;
            }
            Navigator.pushReplacementNamed(context, ResultScreen.routeName);
          } else {
            if (QuizController.selectedQuiz[widget.index].correctAnswer ==
                widget.text) {
              QuizController.correctAnswers.add(true);
            } else {
              QuizController.correctAnswers.add(false);
            }
            Navigator.pushReplacementNamed(context, QuizScreen.routeName,
                arguments: widget.index + 1);
          }
        },
        fontSize: 80.sp,
        backgroundColor: Colors.white,
        internalPadding: const EdgeInsets.all(20),
      ),
    );
  }
}

List<_BuildButton> buildButton(List<String> options, int index) {
  List<_BuildButton> list = [];
  for (int i = 0; i < options.length; i++) {
    final widget = _BuildButton(
      index: index,
      text: options[i],
    );
    list.add(widget);
  }
  return list;
}
