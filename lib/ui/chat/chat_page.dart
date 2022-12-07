import 'package:chatbot/ui/chat/chat_message_list_item.dart';
import 'package:chatbot/ui/chat/chat_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  static const String route = '/chat';
  final String id;

  const ChatPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  final ChatNotifier notifier = ChatNotifier();

  @override
  void initState() {
    super.initState();
    notifier.loadData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => notifier,
      child: Scaffold(body: SafeArea(
        child: Consumer<ChatNotifier>(
          builder: (context, notifier, child) {
            return Center(
                child: Column(
              children: [
                Expanded(
                  child: AnimatedList(
                    key: notifier.listKey,
                    reverse: true,
                    initialItemCount: notifier.messages.length,
                    itemBuilder: (_, index, animation) {
                      return SizeTransition(
                        sizeFactor: animation.drive(
                          CurveTween(curve: Curves.easeOut),
                        ),
                        child: ChatMessageListItem(
                          message: notifier.messages[index],
                        ),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: notifier.whoIsTyping != null,
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('${notifier.whoIsTyping} is typing...')),
                  ),
                ),
                MaterialButton(
                    onPressed: () =>
                        notifier.sendMessage(DateTime.now().toString()),
                    child: const Text('Send')),
              ],
            ));
          },
        ),
      )),
    );
  }
}
