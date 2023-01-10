import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:love_test_app/utils/my_audio_player.dart';
import 'package:love_test_app/utils/size_config.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class LevelEndDialog extends StatelessWidget {
  final bool isSuccessful;

  const LevelEndDialog(this.isSuccessful);

  @override
  Widget build(BuildContext context) {
    final confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
    if (isSuccessful) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        confettiController.play();
      });
    }

    return Container(
      color: Colors.orange,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(color: Colors.orange),
            height: getProportionateScreenHeight(230),
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                LoopAnimation<double>(
                  duration: 3.seconds,
                  tween: 0.0.tweenTo(1),
                  builder: (_, animChild, value) {
                    return Transform.rotate(
                      angle: value * 2 * pi,
                      child: animChild,
                    );
                  },
                  child: Image.asset(
                    'assets/chat/level_burst.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    'assets/chat/level_${isSuccessful ? 'completed' : 'failed'}.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
          _buildConfetti(confettiController),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kPadding * 2),
            child: Text(
              'You ${isSuccessful ? 'WIN' : 'LOSE'}',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white),
            ),
          ),
          _buildBottomButton(),
        ],
      ),
    );
  }

  Future _showBottomButton() async {
    await Future.delayed(1.seconds);

    return;
  }

  Widget _buildBottomButton() {
    return FutureBuilder(
      future: _showBottomButton(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }

        return MyRaisedButton2(
          buttonTitle: isSuccessful ? 'Next Level' : 'Try Again',
          onTap: () {
            MyAudioPlayer.instance.playButtonTap();
            Navigator.pop(context);
          },
          color: isSuccessful ? Colors.green : Colors.redAccent,
        );
      },
    );
  }

  Widget _buildConfetti(ConfettiController confettiController) {
    if (!isSuccessful) return const SizedBox();

    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        confettiController: confettiController,
        blastDirection: pi / 2,
        numberOfParticles: 40,
        maxBlastForce: 70,
        blastDirectionality: BlastDirectionality.explosive,
        minBlastForce: 40,
        gravity: 0.3,
        shouldLoop: false,
        // start again as soon as the animation is finished
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple
        ], // manually specify the colors to be used
      ),
    );
  }

  static Future<void> show(BuildContext context, bool isSuccessful) {
    if (isSuccessful) {
      MyAudioPlayer.instance.playApplause();
    } else {
      HapticFeedback.vibrate();
      MyAudioPlayer.instance.playLevelFailed();
    }

    Dialog dialog = Dialog(
      shape: null,
      child: LevelEndDialog(isSuccessful),
    );
    return showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
      barrierDismissible: false,
    );
  }
}

class MyRaisedButton2 extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;
  final Color color;

  const MyRaisedButton2(
      {required this.buttonTitle, required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.symmetric(vertical: kPadding / 2),
        backgroundColor: color,
      ),
      onPressed: onTap,
      child: Text(
        buttonTitle,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

final kPadding = getProportionateScreenWidth(20.0);
