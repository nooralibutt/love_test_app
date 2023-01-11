import 'package:love_test_app/utils/all_utilities.dart';

class AcceptCallButton extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final void Function() onPressed;

  const AcceptCallButton(
      {Key? key,
      required this.icon,
      required this.bgColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.all(20.h),
      height: 300.h,
      decoration: ShapeDecoration(
        color: bgColor,
        shape: const CircleBorder(),
      ),
      child: IconButton(
          color: Colors.white, onPressed: onPressed, icon: Icon(icon)),
    );
  }
}
