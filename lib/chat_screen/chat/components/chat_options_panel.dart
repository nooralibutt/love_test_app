import 'package:love_test_app/model/chat_level_model.dart';
import 'package:love_test_app/utils/all_utilities.dart';
import 'package:love_test_app/utils/size_config.dart';

class ChatOptionsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomSafeArea = (SizeConfig?.safeAreaPaddingBottom ?? 0) / 2;

    return Container(
      constraints: const BoxConstraints(
          minHeight: 200, maxHeight: 400, minWidth: double.infinity),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
        child: _buildOptions(context),
      ),
    );
  }

  Widget _buildOptions(BuildContext context) {
    return Consumer<ChatScreenProvider>(
      builder: (BuildContext context, model, Widget? child) {
        final options = model.getNextOptions() ?? [];
        if (options.isEmpty) return const SizedBox();

        final List<ElevatedButton> optionButtonList = [];
        for (int i = 0; i < options.length; i++) {
          final option = _buildOptionButton(context, options[i]);
          optionButtonList.add(option);
        }

        return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: optionButtonList);
      },
    );
  }

  ElevatedButton _buildOptionButton(BuildContext context, String text) {
    Color color;
    if (ChatLevel.isLie(text)) {
      color = Colors.red;
    } else if (ChatLevel.isTruth(text)) {
      color = Colors.green;
    } else {
      color = Colors.amberAccent;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(8),
      ),
      onPressed: () => _onClickOption(context, text),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  _onClickOption(BuildContext context, String text) =>
      context.read<ChatScreenProvider>().onOptionSelected(context, text);
}
