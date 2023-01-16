import 'dart:io';

import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:love_test_app/controller/quiz_controller.dart';
import 'package:love_test_app/general_widgets/background_image.dart';
import 'package:love_test_app/general_widgets/general_elevated_button.dart';
import 'package:love_test_app/screen/home_screen/home_screen.dart';
import 'package:love_test_app/screen/quiz_list_screen/quiz_list_screen.dart';
import 'package:love_test_app/utils/all_utilities.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = 'result_screen';

  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double loveResult = QuizController.resultValue * 100;
    return WillPopScope(
      onWillPop: () => QuizController.showExitPopUp(
          context: context,
          onPressedExit: () {
            Navigator.pop(context);
            exit(0);
          },
          dialogText: 'Do you want to exit the app ?'),
      child: BackgroundImage(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 180.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 300.h),
              Text('Love Test Results',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 120.sp)),
              SizedBox(height: 120.h),
              Container(
                height: 150,
                width: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg_image.png'),
                        fit: BoxFit.cover)),
                child: LiquidLinearProgressIndicator(
                  value: QuizController.resultValue,
                  valueColor: const AlwaysStoppedAnimation(Colors.red),
                  backgroundColor: Colors.transparent,
                  borderColor: Colors.transparent,
                  borderWidth: QuizController.resultValue,
                  direction: Axis.vertical,
                  // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                  center: Text(('${loveResult.round()} % \n Love'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 190.sp,
                          fontWeight: FontWeight.bold)), //text inside it
                ),
              ),
              SizedBox(height: 220.h),
              Text('Comments',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 120.sp)),
              SizedBox(height: 40.h),
              QuizController.isAnswered
                  ? const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          'You are a cheater, you picked a call of stranger',
                          textAlign: TextAlign.center,
                          style: TextStyle()),
                    )
                  : const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          'You decline a stranger\'s call shows that you love with your partner',
                          textAlign: TextAlign.center,
                          style: TextStyle()),
                    ),
              SizedBox(height: 190.h),
              GeneralElevatedButton(
                  isLock: false,
                  onPressed: () {
                    QuizController.resultValue = 0;
                    QuizController.correctAnswers.clear();
                    Navigator.pushReplacementNamed(
                        context, QuizListScreen.routeName);
                  },
                  fontSize: 120.sp,
                  backgroundColor: const Color(0xff00c6c6),
                  fontColor: Colors.white,
                  text: 'Take Next Quiz',
                  internalPadding: const EdgeInsets.all(25),
                  buttonWidth: 20.w),
              SizedBox(height: 190.h),
              GeneralElevatedButton(
                  isLock: false,
                  onPressed: () {
                    QuizController.resultValue = 0;
                    QuizController.correctAnswers.clear();
                    QuizController.hisName = '';
                    QuizController.herName = '';
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  },
                  fontSize: 120.sp,
                  backgroundColor: const Color(0xff00d300),
                  fontColor: Colors.white,
                  text: 'Home Screen',
                  internalPadding: const EdgeInsets.all(25),
                  buttonWidth: 20.w),
              SizedBox(height: 190.h),
            ],
          ),
        ),
      )),
    );
  }
}
