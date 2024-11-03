import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/chat_model.dart';
import '../services/chat_service.dart';

class ChatProvider with ChangeNotifier {
  final List<Message> _messages = [];
  final ChatService chatService;

  ChatProvider(String apiKey) : chatService = ChatService(apiKey) {
    _loadHistory();
  }

  List<Message> get messages => _messages;

  void addMessage(Message message) {
    _messages.add(message);
    _saveHistory();
    notifyListeners();
  }

  Future<void> sendMessage(String query) async {
    addMessage(Message(text: query, type: MessageType.user));

    try {
      final responseText = await chatService.getAssistantResponse(query);
      addMessage(Message(text: responseText, type: MessageType.assistant));
    } catch (e) {
      addMessage(Message(
          text: "Error: Unable to fetch response.",
          type: MessageType.assistant));
    }
  }

  Future<void> _saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> messagesJson =
        _messages.map((msg) => jsonEncode(msg.toJson())).toList();
    await prefs.setStringList('chat_history', messagesJson);
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? messagesJson = prefs.getStringList('chat_history');

    if (messagesJson != null) {
      _messages.clear();
      for (var message in messagesJson) {
        _messages.add(Message.fromJson(jsonDecode(message)));
      }
      notifyListeners();
    }
  }
}
