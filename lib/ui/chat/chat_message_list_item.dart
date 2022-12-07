import 'package:chatbot/model/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessageListItem extends StatelessWidget {
  final ChatMessage message;
  final bool isCurrentUser;

  const ChatMessageListItem(
      {Key? key, required this.message, this.isCurrentUser = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(12);
    final format = DateFormat('hh:mm');
    final BorderRadiusGeometry borderRadius;
    if (isCurrentUser) {
      borderRadius = const BorderRadius.only(
          topLeft: radius, topRight: radius, bottomLeft: radius);
    } else {
      borderRadius = const BorderRadius.only(
          topRight: radius, bottomLeft: radius, bottomRight: radius);
    }
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
        child: Column(
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start ,
          children: [
            ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: !isCurrentUser,
                      child: CircleAvatar(
                        child: Text(message.sender[0]),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.shade100,
                                borderRadius: borderRadius),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Flexible(child: Text(message.message)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(
                                      format.format(message.modifiedAt),
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
