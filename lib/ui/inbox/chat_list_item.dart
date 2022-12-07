import 'dart:math';

import 'package:chatbot/model/chat.dart';
import 'package:flutter/material.dart';

class ChatListItem extends StatelessWidget {
  final Chat chat;
  final Function(Chat) onClick;

  const ChatListItem({Key? key, required this.chat, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(chat);
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 72),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(mainAxisSize: MainAxisSize.max, children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chat.members.join(', '),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  Text(chat.lastMessage),
                ],
              ),
            ),
            overlapped(chat.members),
          ]),
        ),
      ),
    );
  }

  Widget overlapped(List<String> members) {
    const overlap = 24.0;
    final colors = [Colors.red, Colors.green, Colors.blue];
    final random = Random();
    List<Widget> stackLayers = List<Widget>.generate(members.length, (index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: colors[random.nextInt(colors.length)],
          child: Text(members[index][0]),
        ),
      );
    });

    return Stack(children: stackLayers);
  }
}
