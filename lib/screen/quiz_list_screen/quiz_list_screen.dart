import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:love_test_app/controller/quiz_controller.dart';
import 'package:love_test_app/general_widgets/background_image.dart';
import 'package:love_test_app/model/quiz_model.dart';
import 'package:love_test_app/screen/home_screen/home_screen.dart';
import 'package:love_test_app/screen/quiz-screen/quiz_screen.dart';
import 'package:love_test_app/services/ad_manager.dart';
import 'package:love_test_app/utils/all_utilities.dart';
import 'package:love_test_app/utils/prefs.dart';

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

class _BuildButton extends StatefulWidget {
  const _BuildButton(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  State<_BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<_BuildButton> {
  bool? isWatched = false;

  @override
  Widget build(BuildContext context) {
    final completedLevelCount = Prefs.instance.getCompletedQuizCount();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 250.w, vertical: 100.h),
      child: SizedBox(
          width: 250,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 20,
                  padding: const EdgeInsets.all(20),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () async {
                if (widget.index <= completedLevelCount) {
                  QuizController.resultValue = 0;
                  QuizController.selectedQuiz =
                      QuizModel.quizList[widget.index];
                  Navigator.pushReplacementNamed(context, QuizScreen.routeName);
                } else {
                  QuizController.resultValue = 0;
                  AdManager.instance.showRewardedAds(
                      context: context,
                      onRewardedClosed: () {
                        Prefs.instance.incrementCompletedQuizLevelCount();
                        print(Prefs.instance.getCompletedQuizCount());
                        QuizController.selectedQuiz =
                            QuizModel.quizList[widget.index];
                        Navigator.pushReplacementNamed(
                            context, QuizScreen.routeName);
                      });
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quiz ${widget.index + 1}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 90.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(width: 100.w),
                  (widget.index <= completedLevelCount)
                      ? const SizedBox()
                      : const Icon(
                          Icons.lock,
                          color: Colors.red,
                        ),
                ],
              ))),
    );
  }
}
