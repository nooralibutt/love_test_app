import 'package:love_test_app/screen/home_screen/components/my_text_field.dart';
import 'package:love_test_app/utils/all_utilities.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Text('Love Test', style: TextStyle(
                    fontFamily: "BuiltTitlingRg",
                    fontSize: 500.sp,
                    color: Colors.white,
                  )),
                ),
              ),
              const MyTextField(hintText: 'Enter your name',),
              const MyTextField(hintText: 'His/Her name',),
            ],
          ),
        ),
      ),
    );
  }
}
