import 'package:love_test_app/utils/all_utilities.dart';

class HeadingText extends StatelessWidget {
  final String headingText;

  const HeadingText({Key? key, required this.headingText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 300.h, horizontal: 100.w),
      child: Center(
        child: Text(
          headingText,
          style: TextStyle(fontSize: 150.sp),
        ),
      ),
    );
  }
}
