import 'package:love_test_app/chat_screen/chat_level_screen.dart';
import 'package:love_test_app/controller/quiz_controller.dart';
import 'package:love_test_app/general_widgets/background_image.dart';
import 'package:love_test_app/general_widgets/general_elevated_button.dart';
import 'package:love_test_app/model/quiz_model.dart';
import 'package:love_test_app/screen/home_screen/home_screen.dart';
import 'package:love_test_app/screen/quiz-screen/components/heading_text.dart';
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
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          },
          dialogText: 'Do you want to leave the Love test?'),
      child: BackgroundImage(
        child: SingleChildScrollView(
          child: Column(children: [
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

class _BuildButton extends StatelessWidget {
  const _BuildButton({
    Key? key,
    required this.index,
    required this.text,
  }) : super(key: key);

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    final questions = QuizModel.quiz1;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 80.h),
      child: GeneralElevatedButton(
        buttonWidth: 250,
        fontColor: Colors.black,
        text: text,
        onPressed: () {
          if (index >= questions.length - 1) {
            for (int i = 0; i < QuizController.correctAnswers.length - 1; i++) {
              if (QuizController.correctAnswers[i] == true) {
                QuizController.resultValue = QuizController.resultValue + 1.0;
              }
            }
            QuizController.resultValue =
                QuizController.resultValue.roundToDouble() * 10;
            Navigator.pushReplacementNamed(context, ChatLevelScreen.routeName);
          } else {
            if (questions[index].correctAnswer == text) {
              QuizController.correctAnswers.add(true);
            } else {
              QuizController.correctAnswers.add(false);
            }
            Navigator.pushReplacementNamed(context, QuizScreen.routeName,
                arguments: index + 1);
          }
        },
        fontSize: 90.sp,
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
