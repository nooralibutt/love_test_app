import 'package:love_test_app/utils/all_utilities.dart';

class LoveChatAvatar extends StatelessWidget {
  final String imgSrc;

  const LoveChatAvatar(
    this.imgSrc, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(
            imgSrc,
          ),
        ),
        border: Border.all(color: Colors.white12, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
      ),
    );
  }
}
