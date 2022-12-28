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
    int index = ModalRoute.of(context)?.settings.arguments as int? ?? 0;
    final questions = QuizModel.quiz1;
    return BackgroundImage(
      child: SingleChildScrollView(
        child: Column(children: [
          HeadingText(
            headingText: questions[index].headingText,
          ),
          ..._buildButton(questions[index].options, index),
          SizedBox(height: 70.h),
          Text('${index + 1}/10',
              style: TextStyle(fontSize: 130.sp, fontWeight: FontWeight.bold))
        ]),
      ),
    );
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
        onPressed: () {
          if (index >= questions.length - 1) {
            Navigator.pushNamed(context, HomeScreen.routeName);
          } else {
            Navigator.pushNamed(context, QuizScreen.routeName,
                arguments: index + 1);
          }
        },
        fontSize: 90.sp,
        backgroundColor: Colors.white,
        text: text,
        internalPadding: const EdgeInsets.all(20),
      ),
    );
  }
}
