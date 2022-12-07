import 'package:chatbot/model/chat_message.dart';
import 'package:flutter/material.dart';

class ChatMessageListItem extends StatelessWidget {
  final ChatMessage message;

  const ChatMessageListItem({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 48,
            child: Text(message.message)),
      ],
    );
  }
}
