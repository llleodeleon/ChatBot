import 'package:chatbot/ui/chat/chat_page.dart';
import 'package:chatbot/ui/inbox/chat_list_item.dart';
import 'package:chatbot/ui/inbox/inbox_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InboxPage extends StatelessWidget {
  static const String route = '/';

  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = InboxNotifier();
    notifier.loadData();

    return ChangeNotifierProvider(
      create: (_) => notifier,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Inbox'),
        ),
        body: SafeArea(
          child: Center(
            child: Consumer<InboxNotifier>(
              builder: (context, notifier, child) {
                return ListView.builder(
                    itemCount: notifier.chats.length,
                    itemBuilder: (context, index) {
                      return ChatListItem(
                        chat: notifier.chats[index],
                        onClick: (chat) {
                          Navigator.pushNamed(
                            context,
                            ChatPage.route,
                            arguments: ChatPageArgs(
                                id: chat.id, title: chat.members.join(', ')),
                          );
                        },
                      );
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}
