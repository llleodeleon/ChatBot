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

class _ChatPageState extends State<ChatPage> {
  late final ChatNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = context.read<ChatNotifier>();
    notifier.loadData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          Text('${context.watch<ChatNotifier>().messages.length}'),
          Text(widget.id),
        ],
      ),
    )));
  }
}
