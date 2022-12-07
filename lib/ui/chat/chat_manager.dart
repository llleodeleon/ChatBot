import 'dart:math';

import 'package:chatbot/model/chat_message.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class ChatManager {
  List<ChatMessage> _messages = [];
  List<String> _senders = [];
  final String sender;

  ChatManager({required this.sender});

  List<ChatMessage> get messages => _messages;

  void init(List<ChatMessage> currentMessages) {
    _messages = currentMessages;
    _senders = currentMessages.map((e) => e.sender).toList();
  }

  void sendMessage(String message) {
    final newMessage = ChatMessage(
        id: _nextId(),
        message: message,
        modifiedAt: DateTime.now(),
        sender: sender);
    _messages.add(newMessage);
  }

  String _nextId() {
    final lastId = _messages.isNotEmpty ? _messages.last.id : "1000";
    final id = int.parse(lastId) + 1;
    return id.toString();
  }

  String nextSender() {
    if (_senders.isEmpty) {
      _senders.add("Bot");
    }
    final random = Random();
    final sender = _senders[random.nextInt(_senders.length)];
    return sender;
  }

  void sendRandomMessage(String sender) {
    final random = Random();
    final message = lorem(words: random.nextInt(29) + 1);
    final newMessage = ChatMessage(
        id: _nextId(),
        message: message,
        modifiedAt: DateTime.now(),
        sender: sender);
    _messages.add(newMessage);
  }
}
