class Message {
  final String text;
  final MessageType type;

  Message({required this.text, required this.type});

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'type': type.toString().split('.').last,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text'],
      type: MessageType.values
          .firstWhere((e) => e.toString().split('.').last == json['type']),
    );
  }
}

enum MessageType {
  user,
  assistant,
}
