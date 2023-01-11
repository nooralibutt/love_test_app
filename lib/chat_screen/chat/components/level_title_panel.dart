import 'package:love_test_app/utils/all_utilities.dart';
import 'package:love_test_app/utils/size_config.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class ControlLevelTitlePanel extends StatelessWidget {
  const ControlLevelTitlePanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ChatScreenProvider, IntroPopupState>(
      selector: (context, model) => model.introPopupState,
      builder: (BuildContext context, introPopupState, Widget? child) {
        if (introPopupState == IntroPopupState.shouldDisplay) {
          return const LevelTitlePanel();
        } else if (introPopupState == IntroPopupState.shouldHide) {
          return const LevelTitlePanel(
              control: CustomAnimationControl.playReverse);
        }
        return const SizedBox();
      },
      child: const SizedBox(),
    );
  }
}

class LevelTitlePanel extends StatelessWidget {
  final CustomAnimationControl control;

  const LevelTitlePanel({this.control = CustomAnimationControl.play});

  @override
  Widget build(BuildContext context) {
    final levelName = context
        .select((ChatScreenProvider provider) => provider.level.levelName);
    final delay = 100.milliseconds;
    final duration = 300.milliseconds;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildContainerLine(context, delay, duration, true),
        CustomAnimation<double>(
          control: control,
          tween: 0.0.tweenTo(1.0),
          builder: (context, child, value) {
            return Opacity(
              opacity: value,
              child: child,
            );
          },
          delay: delay,
          duration: duration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              levelName,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        _buildContainerLine(context, delay, duration, false),
      ],
    );
  }

  SizedBox _buildContainerLine(
      BuildContext context, Duration delay, Duration duration, bool isUpper) {
    final multiplier = isUpper ? -1 : 1;
    return SizedBox(
      height: 20,
      child: Stack(
        children: [
          CustomAnimation<double>(
            control: control,
            tween: 1.0.tweenTo(0.0),
            builder: (context, child, value) {
              return Positioned(
                right: multiplier * (SizeConfig.screenWidth ?? 0) * value,
                child: child ?? const SizedBox(),
              );
            },
            delay: delay,
            duration: duration,
            child: Container(
              color: Theme.of(context).accentColor,
              width: SizeConfig.screenWidth,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
