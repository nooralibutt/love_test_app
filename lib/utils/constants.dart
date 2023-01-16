import 'package:love_test_app/utils/all_utilities.dart';

Future showRewardedAdAlertDialog(BuildContext context,
    {required VoidCallback onWatchAd,
    required String title,
    required String content}) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () => Navigator.of(context).pop(),
  );
  Widget watchAdButton = TextButton(
    onPressed: () {
      Navigator.of(context).pop();
      onWatchAd.call();
    },
    child: const Text("Watch Ad"),
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [okButton, watchAdButton],
  );
  // show the dialog
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => alert,
  );
}
