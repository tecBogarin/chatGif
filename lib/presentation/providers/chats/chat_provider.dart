import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'HolaAmor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste ?', fromWho: FromWho.me),
    Message(
        text: 'no bb!',
        fromWho: FromWho.hers,
        imageUrl:
            'https://yesno.wtf/assets/no/13-755222c98795431aa2e7d453ab1e75a1.gif'),
    Message(text: 'Ya regresaste ?', fromWho: FromWho.me),
    Message(text: 'Pasare programación Mobil ?', fromWho: FromWho.me),
    Message(
        text: 'nel paste!',
        fromWho: FromWho.hers,
        imageUrl:
            'https://yesno.wtf/assets/no/13-755222c98795431aa2e7d453ab1e75a1.gif'),
    Message(text: 'que malvado', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final neMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(neMessage);

//notifica a todos para su actualización de datos
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
