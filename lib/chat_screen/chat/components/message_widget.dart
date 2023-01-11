import 'package:love_test_app/model/love_chat_level_model.dart';
import 'package:love_test_app/utils/all_utilities.dart';

import 'love_chat_avatar.dart';

class MessageWidget extends StatelessWidget {
  final bool isSender;
  final ChatLevel level;
  final String message;

  const MessageWidget(this.isSender, this.level, this.message);

  @override
  Widget build(BuildContext context) {
    final List<Widget> body = [
      _buildChatAvatar(),
      _buildMessageBody(context),
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: isSender ? body : body.reversed.toList(),
      ),
    );
  }

  String _truncateParentheses(String str) =>
      str.replaceAll(RegExp(r"\(.+?\)"), '');

  Container _buildMessageBody(BuildContext context) {
    final truncatedMessage = _truncateParentheses(message);

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .7,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 12,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        color: isSender ? Colors.white38 : Theme.of(context).accentColor,
      ),
      child: Text(
        truncatedMessage,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  LoveChatAvatar _buildChatAvatar() =>
      LoveChatAvatar(isSender ? level.botImg : level.userImg);
}
