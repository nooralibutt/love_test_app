import 'package:love_test_app/general_widgets/general_elevated_button.dart';
import 'package:love_test_app/screen/home_screen/components/my_text_field.dart';
import 'package:love_test_app/utils/all_utilities.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

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
                          fontSize: 500.sp,
                          color: Colors.white,
                        )),
                  ),
                ),
                MyTextField(
                  hintText: 'Enter your name',
                  onChanged: (value) {},
                ),
                MyTextField(
                  hintText: 'His/Her name',
                  onChanged: (value) {},
                ),
                const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 110, vertical: 60),
                    child: GeneralElevatedButton(
                      text: 'Start Test',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
