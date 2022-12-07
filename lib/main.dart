import 'package:chatbot/ui/chat/chat_page.dart';
import 'package:chatbot/ui/inbox/inbox_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.sourceSans3TextTheme(),
        primarySwatch: Colors.blue,
      ),
      routes: {
        InboxPage.route: (context) => const InboxPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ChatPage.route) {
          final args = settings.arguments as ChatPageArgs;
          return MaterialPageRoute(builder: (_) => ChatPage(args: args));
        }
        return null;
      },
    );
  }
}
