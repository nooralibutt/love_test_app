import 'package:love_test_app/utils/all_utilities.dart';

class GeneralElevatedButton extends StatelessWidget {
  final double? buttonHeight;
  final void Function()? onPressed;
  final double? fontSize;
  final Color? backgroundColor;
  final String text;

  const GeneralElevatedButton(
      {Key? key,
      this.buttonHeight,
      this.onPressed,
      this.fontSize,
      this.backgroundColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: buttonHeight ?? 40,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? const Color(0xff00d300),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize ?? 20),
            )));
  }
}
