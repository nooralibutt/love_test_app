import 'package:love_test_app/utils/all_utilities.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;

  const BaseScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: 900,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_image.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: child),
      ),
    );
  }
}
