import 'package:love_test_app/controller/quiz_controller.dart';
import 'package:love_test_app/screen/call_screen/components/accept_call_button.dart';
import 'package:love_test_app/utils/all_utilities.dart';
import 'package:love_test_app/utils/call_vibrator.dart';
import 'package:love_test_app/utils/my_audio_player.dart';

class CallScreen extends StatefulWidget {
  static const String routeName = 'call_screen';

  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  void initState() {
    MyAudioPlayer.instance.playRingtone();
    MyVibrator.ringtoneVibrate();
    super.initState();
  }

  @override
  void dispose() {
    _stopRingtone();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252331),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 170.h),
            Center(
                child: Text('Maria',
                    style: TextStyle(color: Colors.white, fontSize: 110.sp))),
            SizedBox(height: 20.h),
            Center(
                child: Text('Calling....',
                    style: TextStyle(color: Colors.white, fontSize: 40.sp))),
            SizedBox(height: 90.h),
            Icon(Icons.person, color: Colors.white, size: 500.h),
            SizedBox(height: 1200.h),
            SizedBox(height: 100.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AcceptCallButton(
                  icon: Icons.call_end,
                  bgColor: Colors.red,
                  onPressed: () async {
                    QuizController.isAnswered = false;
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 200.w),
                AcceptCallButton(
                    icon: Icons.call,
                    bgColor: Colors.green,
                    onPressed: () async {
                      QuizController.isAnswered = true;
                      Navigator.pop(context);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  _stopRingtone() {
    MyAudioPlayer.instance.stopRingtone();
    MyVibrator.stop();
  }
}
