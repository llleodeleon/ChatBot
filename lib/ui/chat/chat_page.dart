import 'package:chatbot/ui/chat/chat_message_list_item.dart';
import 'package:chatbot/ui/chat/chat_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPageArgs {
  final String id;
  final String title;

  ChatPageArgs({required this.id, required this.title});
}

class ChatPage extends StatefulWidget {
  static const String route = '/chat';
  final ChatPageArgs args;

  const ChatPage({Key? key, required this.args}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  final ChatNotifier notifier = ChatNotifier();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    notifier.loadData(widget.args.id);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => notifier,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.args.title),
          ),
          body: SafeArea(
            child: Consumer<ChatNotifier>(
              builder: (context, notifier, child) {
                return Center(
                    child: Column(
                  children: [
                    Expanded(
                      child: AnimatedList(
                        key: notifier.listKey,
                        reverse: true,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        initialItemCount: notifier.messages.length,
                        itemBuilder: (_, index, animation) {
                          final message = notifier.messages[index];
                          return SizeTransition(
                            sizeFactor: animation.drive(
                              CurveTween(curve: Curves.easeOut),
                            ),
                            child: ChatMessageListItem(
                              message: message,
                              isCurrentUser: message.sender == "You",
                            ),
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: notifier.whoIsTyping != null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          height: 32,
                          width: double.infinity,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child:
                                  Text('${notifier.whoIsTyping} is typing...')),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: controller,
                              textInputAction: TextInputAction.send,
                              decoration: const InputDecoration(
                                  hintText: 'Type a message'),
                              onSubmitted: (text) {
                                _sendText(text);
                              },
                            ),
                          )),
                          MaterialButton(
                              onPressed: () {
                                _sendText(controller.text);
                              },
                              child: const Text('Send'))
                        ],
                      ),
                    ),
                  ],
                ));
              },
            ),
          )),
    );
  }

  void _sendText(String text) {
    notifier.sendMessage(text);
    setState(() {
      controller.clear();
    });
  }
}
