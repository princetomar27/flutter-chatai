import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/chat_provider.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({super.key});

  @override
  MessageInputState createState() => MessageInputState();
}

class MessageInputState extends State<MessageInput> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    final query = _controller.text.trim();
    Provider.of<ChatProvider>(context, listen: false).sendMessage(query);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            hintText: "Message ChatGPT",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            suffix: IconButton(
              alignment: Alignment.bottomCenter,
              icon: const Icon(Icons.send),
              onPressed: _sendMessage,
            ),
            constraints: const BoxConstraints(maxHeight: 50)),
      ),
    );
  }
}
