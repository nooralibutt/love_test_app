import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:love_test_app/utils/all_utilities.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class TypingPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final senderName =
        context.select((ChatScreenProvider provider) => provider.level.botName);
    return Selector<ChatScreenProvider, bool>(
      selector: (context, model) => model.isTyping,
      builder: (BuildContext context, isTyping, Widget? child) {
        return Visibility(
          visible: isTyping,
          child: PlayAnimation(
            duration: 200.milliseconds,
            tween: 0.0.tweenTo(1),
            builder: (_, animChild, double value) {
              return Opacity(
                opacity: value,
                child: animChild,
              );
            },
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Text(
              "$senderName is typing ",
              style: const TextStyle(color: Colors.white38),
            ),
            SpinKitThreeBounce(
              color: Theme.of(context).accentColor,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
