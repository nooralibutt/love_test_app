import 'package:love_test_app/controller/correct_answers_list.dart';
import 'package:love_test_app/general_widgets/background_image.dart';
import 'package:love_test_app/general_widgets/general_elevated_button.dart';
import 'package:love_test_app/screen/home_screen/home_screen.dart';
import 'package:love_test_app/screen/quiz-screen/quiz_screen.dart';
import 'package:love_test_app/utils/all_utilities.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = 'result_screen';

  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 180.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 300,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_image.png'),
                    fit: BoxFit.cover)),
            child: Center(
                child: Text(
                    '${QuizController.resultValue.toStringAsFixed(0)} % ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 140.sp))),
          ),
          SizedBox(height: 190.h),
          GeneralElevatedButton(
              onPressed: () {},
              fontSize: 120.sp,
              backgroundColor: const Color(0xff00c6c6),
              fontColor: Colors.white,
              text: 'Take Next Quiz',
              internalPadding: const EdgeInsets.all(25),
              buttonWidth: 20.w),
          SizedBox(height: 190.h),
          GeneralElevatedButton(
              onPressed: () {
                QuizController.resultValue = 0;
                QuizController.correctAnswers.clear();
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              fontSize: 120.sp,
              backgroundColor: const Color(0xff00d300),
              fontColor: Colors.white,
              text: 'Home Screen',
              internalPadding: const EdgeInsets.all(25),
              buttonWidth: 20.w),
        ],
      ),
    ));
  }

  void calculateLove() {
    QuizScreen quizScreen = const QuizScreen();
  }
}
