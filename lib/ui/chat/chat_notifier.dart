import 'package:chatbot/data/chat_repository.dart';
import 'package:chatbot/model/chat_message.dart';
import 'package:flutter/cupertino.dart';

class ChatNotifier extends ChangeNotifier {
  final ChatRepository _repository = ChatRepository();

  List<ChatMessage> _botMessages = List.empty();
  List<ChatMessage> get messages => _botMessages;

  void loadData(String id) async {
    _botMessages = await _repository.getChatMessages(id);
    notifyListeners();
  }
}