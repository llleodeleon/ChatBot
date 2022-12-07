import 'package:chatbot/data/chat_repository.dart';
import 'package:chatbot/model/chat.dart';
import 'package:flutter/cupertino.dart';

class InboxNotifier extends ChangeNotifier {
  final ChatRepository _repository = ChatRepository();
  List<Chat> _chats = List.empty();
  List<Chat> get chats => _chats;

  void loadData() async {
    _chats = await _repository.getChats();
    notifyListeners();
  }
}