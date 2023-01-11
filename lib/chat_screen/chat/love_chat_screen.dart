import 'package:flutter/cupertino.dart';
import 'package:love_test_app/model/love_chat_level_model.dart';
import 'package:love_test_app/utils/all_utilities.dart';

import 'components/chat_options_panel.dart';
import 'components/level_title_panel.dart';
import 'components/love_chat_app_bar.dart';
import 'components/love_chat_list_widget.dart';
import 'components/typing_panel.dart';

class LoveChatScreen extends StatelessWidget {
  static const String routeName = "/chatScreen";

  const LoveChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatLevel level =
        ModalRoute.of(context)!.settings.arguments as ChatLevel;

    return Scaffold(
      appBar: LoveChatHeaderWidget(level.botName, level.botImg),
      body: ListenableProvider(
        create: (context) => ChatScreenProvider(level),
        builder: (context, Widget? child) => _buildBody(context, level),
      ),
    );
  }

  Widget _buildBody(BuildContext context, ChatLevel level) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Expanded(child: LoveChatListWidget(level)),
            TypingPanel(),
            ChatOptionsPanel(),
          ],
        ),
        const ControlLevelTitlePanel(),
      ],
    );
  }
}
