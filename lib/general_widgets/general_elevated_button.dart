import 'package:love_test_app/utils/all_utilities.dart';

class GeneralElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final double fontSize;
  final Color backgroundColor;
  final String text;
  final Color fontColor;
  final EdgeInsets internalPadding;
  final double buttonWidth;
  final bool isLock;

  const GeneralElevatedButton({Key? key,
    required this.onPressed,
    required this.fontSize,
    required this.backgroundColor,
    required this.fontColor,
    required this.text,
    required this.internalPadding,
    required this.buttonWidth,
    required this.isLock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: buttonWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 20,
              padding: internalPadding,
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          child:
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: fontSize,
                color: fontColor,
                fontWeight: FontWeight.normal),
          ),

        ));
  }
}
