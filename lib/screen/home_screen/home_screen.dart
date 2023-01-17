import 'dart:io';

import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:love_test_app/controller/quiz_controller.dart';
import 'package:love_test_app/general_widgets/background_image.dart';
import 'package:love_test_app/general_widgets/general_elevated_button.dart';
import 'package:love_test_app/screen/home_screen/components/my_text_field.dart';
import 'package:love_test_app/screen/quiz_list_screen/quiz_list_screen.dart';
import 'package:love_test_app/utils/all_utilities.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => QuizController.showExitPopUp(
          context: context,
          onPressedExit: () {
            exit(0);
          },
          dialogText: 'Do you want to eit the app?'),
      child: BackgroundImage(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Text('Love Test',
                      style: TextStyle(
                        fontFamily: "BuiltTitlingRg",
                        fontSize: 450.sp,
                        color: Colors.white,
                      )),
                ),
              ),
              const EasyBannerAd(),
              MyTextField(
                hintText: 'Enter your name',
                onChanged: (value) {
                  QuizController.hisName = value;
                },
              ),
              MyTextField(
                hintText: 'Enter partner\'s name',
                onChanged: (value) {
                  QuizController.herName = value;
                },
              ),
              MyTextField(
                hintText: 'Age of Relationship',
                onChanged: (value) {},
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 110, vertical: 130.h),
                  child: GeneralElevatedButton(
                    isLock: false,
                    buttonWidth: 300,
                    text: 'Start Test',
                    fontColor: Colors.black,
                    internalPadding: const EdgeInsets.all(12),
                    onPressed: () {
                      if (QuizController.hisName == '' ||
                          QuizController.herName == '') {
                        showDialog(
                            context: context,
                            builder: (context) => const SimpleDialog(
                                  title: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child:
                                        Center(child: Text('Enter both names')),
                                  ),
                                ));
                      } else {
                        Navigator.pushReplacementNamed(
                            context, QuizListScreen.routeName);
                      }
                    },
                    fontSize: 20,
                    backgroundColor: const Color(0xff00d300),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
