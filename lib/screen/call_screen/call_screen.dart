import 'package:love_test_app/screen/call_screen/components/accept_call_button.dart';
import 'package:love_test_app/screen/call_screen/components/icon_card.dart';
import 'package:love_test_app/utils/all_utilities.dart';

class CallScreen extends StatelessWidget {
  static const String routeName = 'call_screen';

  const CallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252331),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 170.h),
            Center(
                child: Text('Unknown',
                    style: TextStyle(color: Colors.white, fontSize: 110.sp))),
            SizedBox(height: 20.h),
            Center(
                child: Text('Calling....',
                    style: TextStyle(color: Colors.white, fontSize: 40.sp))),
            SizedBox(height: 90.h),
            Icon(Icons.person, color: Colors.white, size: 500.h),
            SizedBox(height: 1000.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const IconCard(
                    title: 'Remind Me', icon: Icons.remember_me_rounded),
                SizedBox(width: 200.w),
                const IconCard(title: 'Message', icon: Icons.message),
              ],
            ),
            SizedBox(height: 100.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AcceptCallButton(
                  icon: Icons.call_end,
                  bgColor: Colors.red,
                ),
                SizedBox(width: 100),
                AcceptCallButton(
                  icon: Icons.call,
                  bgColor: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
