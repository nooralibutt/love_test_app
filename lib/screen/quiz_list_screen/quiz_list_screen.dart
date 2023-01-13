import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:love_test_app/controller/quiz_controller.dart';
import 'package:love_test_app/general_widgets/background_image.dart';
import 'package:love_test_app/general_widgets/general_elevated_button.dart';
import 'package:love_test_app/model/quiz_model.dart';
import 'package:love_test_app/screen/home_screen/home_screen.dart';
import 'package:love_test_app/screen/quiz-screen/quiz_screen.dart';
import 'package:love_test_app/utils/all_utilities.dart';

class QuizListScreen extends StatelessWidget {
  static const String routeName = 'quiz_list_screen';

  const QuizListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < QuizModel.quizList.length; i++) {
      list.add(_BuildButton(i));
    }
    list.insert(
        0,
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: BackButton(
              onPressed: () {
                QuizController.herName = '';
                QuizController.hisName = '';
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
            ),
          ),
        ));

    list.insert(6, const EasyBannerAd());

    list.insert(
        1,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(QuizController.hisName, style: TextStyle(fontSize: 80.sp)),
            Text('  ❤️  ', style: TextStyle(fontSize: 80.sp)),
            Text(QuizController.herName, style: TextStyle(fontSize: 80.sp)),
          ],
        ));

    return BackgroundImage(
        child: Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: list,
        ),
      ),
    ));
  }
}

class _BuildButton extends StatelessWidget {
  const _BuildButton(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 250.w, vertical: 100.h),
      child: GeneralElevatedButton(
        buttonWidth: 250,
        fontColor: Colors.black,
        text: 'Quiz ${index + 1}',
        onPressed: () {
          QuizController.selectedQuiz = QuizModel.quizList[index];
          Navigator.pushReplacementNamed(context, QuizScreen.routeName);
        },
        fontSize: 90.sp,
        backgroundColor: Colors.white,
        internalPadding: const EdgeInsets.all(20),
      ),
    );
  }
}
