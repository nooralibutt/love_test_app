import 'package:love_test_app/general_widgets/base_scaffold.dart';
import 'package:love_test_app/general_widgets/general_elevated_button.dart';
import 'package:love_test_app/screen/home_screen/components/my_text_field.dart';
import 'package:love_test_app/utils/all_utilities.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(child: SingleChildScrollView(
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
          Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 110, vertical: 60),
              child: GeneralElevatedButton(
                buttonHeight: 40,
                text: 'Start Test',
                onPressed: () {},
                fontSize: 20,
                backgroundColor: const Color(0xff00d300),
              ))
        ],
      ),
    ),);
  }
}
