import 'package:flutter/scheduler.dart';
import 'package:love_test_app/model/love_chat_level_model.dart';
import 'package:love_test_app/utils/all_utilities.dart';

import 'message_widget.dart';

class LoveChatListWidget extends StatelessWidget {
  final ChatLevel level;
  final bool willSenderInitiateChat;

  LoveChatListWidget(this.level)
      : willSenderInitiateChat = level.willSenderInitiateChat;

  bool _isSender(int index) {
    if (willSenderInitiateChat) {
      return index % 2 == 0;
    } else {
      return index % 2 == 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatScreenProvider>(
      builder: (BuildContext context, model, Widget? child) {
        final _scrollController = new ScrollController();
        if (model.messages.isNotEmpty) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 100),
              curve: Curves.ease,
            );
          });
        }

        return ListView.builder(
          controller: _scrollController,
          itemCount: model.messages.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return MessageWidget(
                _isSender(index), level, model.messages[index]);
          },
        );
      },
    );
  }
}
