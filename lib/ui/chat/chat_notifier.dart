import 'package:chatbot/data/chat_repository.dart';
import 'package:chatbot/model/chat_message.dart';
import 'package:chatbot/ui/chat/chat_manager.dart';
import 'package:flutter/cupertino.dart';

class ChatNotifier extends ChangeNotifier {
  final ChatRepository _repository = ChatRepository();
  final ChatManager _manager = ChatManager(sender: 'You');
  final _messageDelay = const Duration(seconds: 2);
  final _insertDelay = const Duration(milliseconds: 300);
  final _noDelay = const Duration(milliseconds: 0);
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  List<ChatMessage> get messages => _manager.messages.reversed.toList();
  String? whoIsTyping;

  void loadData(String id) async {
    final messages = await _repository.getChatMessages(id);
    _manager.init(messages);

    for (var i = 0 ; i < messages.length; i++) {
      listKey.currentState!.insertItem(i, duration: _noDelay);
    };

    notifyListeners();
  }

  void sendMessage(String message) async {
    _manager.sendMessage(message);
    _updateList();
    notifyListeners();

    final nextSender = _manager.nextSender();
    await Future.delayed(_messageDelay, () {
      whoIsTyping = nextSender;
      notifyListeners();
    });

    await Future.delayed(_messageDelay, () {
      whoIsTyping = null;
      notifyListeners();
    });

    _manager.sendRandomMessage(nextSender);
    whoIsTyping = null;
    _updateList();
    notifyListeners();
  }

  void _updateList() {
    listKey.currentState!.insertItem(0, duration: _insertDelay);
  }
}