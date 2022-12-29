import 'package:love_test_app/general_widgets/background_image.dart';
import 'package:love_test_app/general_widgets/general_elevated_button.dart';
import 'package:love_test_app/model/quiz_model.dart';
import 'package:love_test_app/screen/quiz-screen/components/heading_text.dart';
import 'package:love_test_app/screen/result_screen/result_screen.dart';
import 'package:love_test_app/utils/all_utilities.dart';

class QuizScreen extends StatelessWidget {
  static const String routeName = 'quiz_screen';

  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int? ?? 0;
    List<bool> correctAnswersList = [];
    final questions = QuizModel.quiz1;
    return BackgroundImage(
      child: SingleChildScrollView(
        child: Column(children: [
          HeadingText(
            headingText: questions[index].headingText,
          ),
          ..._buildButton(questions[index].options, index, correctAnswersList),
          SizedBox(height: 70.h),
          Text('${index + 1}/10',
              style: TextStyle(fontSize: 130.sp, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }

  List<_BuildButton> _buildButton(
      List<String> options, int index, List<bool> correctAnswersList) {
    final questions = QuizModel.quiz1;
    List<_BuildButton> list = [];
    for (int i = 0; i < options.length; i++) {
      final widget = _BuildButton(
        correctAnswersList: correctAnswersList,
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
    required this.correctAnswersList,
  }) : super(key: key);

  final int index;
  final String text;
  final List<bool> correctAnswersList;

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
            Navigator.pushNamed(context, ResultScreen.routeName);
          } else {
            if (questions[index].correctAnswer == text) {
              correctAnswersList.add(true);
            } else {
              correctAnswersList.add(false);
            }
            Navigator.pushNamed(context, QuizScreen.routeName,
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
