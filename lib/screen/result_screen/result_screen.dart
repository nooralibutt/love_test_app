import 'package:love_test_app/general_widgets/background_image.dart';
import 'package:love_test_app/general_widgets/general_elevated_button.dart';
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
        children: [
          GeneralElevatedButton(
              onPressed: () {},
              fontSize: 120.sp,
              backgroundColor: const Color(0xff00d300),
              fontColor: Colors.white,
              text: 'Share',
              internalPadding: const EdgeInsets.all(25),
              buttonWidth: 700.w),
          SizedBox(height: 80.h),
          GeneralElevatedButton(
              onPressed: () {},
              fontSize: 120.sp,
              backgroundColor: const Color(0xff00c6c6),
              fontColor: Colors.white,
              text: 'Take Quiz 3',
              internalPadding: const EdgeInsets.all(25),
              buttonWidth: 20.w),
        ],
      ),
    ));
  }
}
