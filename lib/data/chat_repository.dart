import 'dart:convert';

import 'package:chatbot/model/chat.dart';
import 'package:chatbot/model/chat_message.dart';
import 'package:flutter/services.dart' show rootBundle;

class ChatRepository {
  Future<List<Chat>> getChats() async {
    final response = await rootBundle.loadString('assets/inbox.json');
    final chats = (jsonDecode(response) as List)
        .map((e) => Chat.fromJson(e)).toList();
    return chats;
  }

  Future<List<ChatMessage>> getChatMessages(String id) async {
    final String? asset;
    switch(id) {
      case '9991':
        asset = 'assets/9991.json';
        break;
      case '9992':
        asset = 'assets/9992.json';
        break;
      case '9993':
        asset = 'assets/9993.json';
        break;
      default:
        asset = null;
    }
    if (asset == null) {
      return List.empty();
    }
    final response = await rootBundle.loadString(asset);
    final messages = (jsonDecode(response) as List)
        .map((e) => ChatMessage.fromJson(e)).toList();
    return messages;
  }
}