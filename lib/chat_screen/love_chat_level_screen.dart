import 'package:love_test_app/chat_screen/chat/love_chat_screen.dart';
import 'package:love_test_app/model/love_chat_level_model.dart';
import 'package:love_test_app/utils/all_utilities.dart';
import 'package:love_test_app/utils/my_audio_player.dart';
import 'package:love_test_app/utils/prefs.dart';
import 'package:simple_animations/stateless_animation/mirror_animation.dart';
import 'package:supercharged/supercharged.dart';

class LoveChatLevelScreen extends StatefulWidget {
  static const String routeName = "/chatLevelScreen";

  const LoveChatLevelScreen({super.key});

  @override
  _LoveChatLevelScreenState createState() => _LoveChatLevelScreenState();
}

class _LoveChatLevelScreenState extends State<LoveChatLevelScreen> {
  final levels = ChatLevel.allLevels();

  @override
  Widget build(BuildContext context) {
    // ChatLevel.printUnreachableKeys();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Stories"),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: _buildLevels(levels),
        ),
      ),
    );
  }

  Widget _buildLevels(List<ChatLevel> levels) {
    List<Widget> widgets = [];
    List<Widget> widgetLines = [];

    const double colPadding = 50, cols = 3, w = 70, h = 70;
    const double rowPadding = 40;

    const stackWidth = cols * (w + rowPadding) - rowPadding;
    final stackHeight = (levels.length / cols) * (h + colPadding);
    widgets.add(SizedBox(height: stackHeight, width: stackWidth));

    bool isReverse = true;
    double left = rowPadding + w;
    double top = colPadding + h;
    for (int i = 0; i < levels.length; i++) {
      if (i % cols == 0) isReverse = !isReverse;

      if (i < levels.length - 1) {
        final widgetLine = _getLineWidget(
            isReverse, i, cols, left, top, w, h, rowPadding, colPadding);
        widgetLines.add(widgetLine);
      }

      final widget = Positioned(
        left: _getLeftIndex(isReverse, i, cols) * left,
        top: i ~/ cols * top,
        width: w,
        height: h,
        child: _buildLevel(i),
      );
      widgets.add(widget);
    }

    widgetLines.addAll(widgets);

    return SizedBox(
      width: double.infinity,
      child: Align(
        child: Stack(children: widgetLines),
        alignment: Alignment.center,
      ),
    );
  }

  Widget _buildLevel(int i) {
    final completedLevelCount = Prefs.instance.getCompletedLevelCount();

    Widget innerWidget;
    if (i < completedLevelCount) {
      innerWidget = const Icon(Icons.check);
    } else if (i == completedLevelCount) {
      innerWidget = MirrorAnimation(
        builder: (BuildContext context, Widget? animChild, double value) {
          return Transform.scale(scale: value, child: animChild);
        },
        duration: 1.seconds,
        curve: Curves.easeInOut,
        tween: 0.9.tweenTo(1.1),
        child: GestureDetector(
          onTap: _onTapLevel,
          child: const Center(
            child: Text(
              '😍',
              style: TextStyle(fontSize: 50, color: Colors.grey),
            ),
          ),
        ),
      );
    } else {
      innerWidget = const Icon(Icons.lock);
    }

    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: i <= completedLevelCount ? Colors.white : Colors.grey,
        ),
        child: innerWidget);
  }

  static double _getLeftIndex(bool isReverse, int i, double cols) {
    cols *= 2;
    if (isReverse) {
      return (cols - 1) - i % cols;
    } else
      return i % cols;
  }

  _getLineWidget(bool isReverse, int i, double cols, double left, double top,
      double w, double h, double rowPadding, double colPadding) {
    final index = i % (cols * 2);
    final selectedColor =
        i < Prefs.instance.getCompletedLevelCount() ? Colors.grey : Colors.pink;
    if (index < 2) {
      return Positioned(
          left: _getLeftIndex(isReverse, i, cols) * left + w / 1.5,
          top: i ~/ cols * top + h / 3,
          width: w,
          height: h / 3,
          child: Container(color: selectedColor));
    } else if (index == 2 || index == 5) {
      return Positioned(
        left: _getLeftIndex(isReverse, i, cols) * left + w / 3,
        top: i ~/ cols * top + h / 3,
        width: w / 3,
        height: colPadding + h,
        child: Container(color: selectedColor),
      );
    } else {
      return Positioned(
        right: (i % cols) * left + w / 1.5,
        top: i ~/ cols * top + h / 3,
        width: w,
        height: h / 3,
        child: Container(color: selectedColor),
      );
    }
  }

  _onTapLevel() async {
    final completedLevelCount = Prefs.instance.getCompletedLevelCount();

    if (completedLevelCount >= levels.length) return;

    MyAudioPlayer.instance.playButtonTap();

    final level = levels[completedLevelCount];
    final isLevelCompleted = await Navigator.pushNamed(
        context, LoveChatScreen.routeName,
        arguments: level);
    final isLevelCompleted2 = isLevelCompleted as bool?;
    if (isLevelCompleted2 == null) return;

    if (isLevelCompleted2) {
      setState(() {});
    }

    Future.delayed(200.milliseconds, _onTapLevel);
  }
}
