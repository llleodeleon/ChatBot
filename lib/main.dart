import 'package:chatbot/ui/chat/chat_notifier.dart';
import 'package:chatbot/ui/chat/chat_page.dart';
import 'package:chatbot/ui/inbox/inbox_notifier.dart';
import 'package:chatbot/ui/inbox/inbox_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => InboxNotifier()),
      ChangeNotifierProvider(create: (_) => ChatNotifier()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        InboxPage.route: (context) => const InboxPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ChatPage.route) {
          final args = settings.arguments as String;
          return MaterialPageRoute(builder: (_) => ChatPage(id: args));
        }
        return null;
      },
    );
  }
}
