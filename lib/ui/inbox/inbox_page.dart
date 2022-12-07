import 'package:chatbot/ui/chat/chat_page.dart';
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
        body: SafeArea(
          child: Center(
            child: Consumer<InboxNotifier>(
              builder: (context, notifier, child) {
                return Column(
                  children: [
                    Text('${notifier.chats.length}'),
                    MaterialButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          ChatPage.route,
                          arguments: '9991',
                        ),
                        child: const Text('Next')),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
