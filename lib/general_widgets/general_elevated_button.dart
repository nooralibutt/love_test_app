import 'package:love_test_app/utils/all_utilities.dart';

class GeneralElevatedButton extends StatelessWidget {
  final double buttonHeight;
  final void Function() onPressed;
  final double fontSize;
  final Color backgroundColor;
  final String text;

  const GeneralElevatedButton(
      {Key? key,
      required this.buttonHeight,
      required this.onPressed,
      required this.fontSize,
      required this.backgroundColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: buttonHeight,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize),
            )));
  }
}
