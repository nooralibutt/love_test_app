import 'package:love_test_app/model/quiz_model.dart';
import 'package:love_test_app/utils/all_utilities.dart';

class QuizController {
  static List<QuizModel> selectedQuiz = [];
  static List<bool> correctAnswers = [];
  static double resultValue = 0;

  static Future<bool> showExitPopUp(
      {required BuildContext context,
      required VoidCallback onPressedExit,
      required String dialogText}) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 340.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dialogText),
                  SizedBox(
                    height: 80.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink),
                        onPressed: onPressedExit,
                        child: const Text('Yes'),
                      )),
                      SizedBox(width: 20.w),
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink),
                        onPressed: () => Navigator.of(context).pop(),
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
}
