import 'package:flutter/cupertino.dart';
import 'package:love_test_app/model/chat_level_model.dart';
import 'package:love_test_app/utils/all_utilities.dart';

import 'components/chat_app_bar.dart';
import 'components/chat_list_widget.dart';
import 'components/chat_options_panel.dart';
import 'components/level_title_panel.dart';
import 'components/typing_panel.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = "/chatScreen";

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatLevel level =
        ModalRoute.of(context)!.settings.arguments as ChatLevel;

    return Scaffold(
      appBar: ChatHeaderWidget(level.botName, level.botImg),
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
            ChatListWidget(level),
            TypingPanel(),
            ChatOptionsPanel(),
          ],
        ),
        const ControlLevelTitlePanel(),
      ],
    );
  }
}
