import 'package:love_test_app/controller/correct_answers_list.dart';
import 'package:love_test_app/general_widgets/background_image.dart';
import 'package:love_test_app/general_widgets/general_elevated_button.dart';
import 'package:love_test_app/model/quiz_model.dart';
import 'package:love_test_app/screen/home_screen/home_screen.dart';
import 'package:love_test_app/screen/quiz-screen/components/heading_text.dart';
import 'package:love_test_app/screen/result_screen/result_screen.dart';
import 'package:love_test_app/utils/all_utilities.dart';

class QuizScreen extends StatelessWidget {
  static const String routeName = 'quiz_screen';

  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int? ?? 0;
    final questions = QuizModel.quiz1;
    return WillPopScope(
      onWillPop: () => showExitPopUp(context),
      child: BackgroundImage(
        child: SingleChildScrollView(
          child: Column(children: [
            HeadingText(
              headingText: questions[index].headingText,
            ),
            ..._buildButton(questions[index].options, index),
            SizedBox(height: 70.h),
            Text('${index + 1}/10',
                style:
                    TextStyle(fontSize: 130.sp, fontWeight: FontWeight.bold)),
          ]),
        ),
      ),
    );
  }

  Future<bool> showExitPopUp(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Do you want to leave the Love test?'),
                  SizedBox(
                    height: 80.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink),
                        onPressed: () {
                          QuizController.correctAnswers.clear();
                          QuizController.resultValue = 0;
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                        child: const Text('Yes'),
                      )),
                      SizedBox(width: 20.w),
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No'),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  List<_BuildButton> _buildButton(List<String> options, int index) {
    final questions = QuizModel.quiz1;
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
            Navigator.pushReplacementNamed(context, ResultScreen.routeName);
          } else {
            if (questions[index].correctAnswer == text) {
              QuizController.correctAnswers.add(true);
            } else {
              QuizController.correctAnswers.add(false);
              print(QuizController.correctAnswers);
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
