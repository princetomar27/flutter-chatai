import 'dart:convert';

import 'package:http/http.dart' as http;

class ChatService {
  final String apiKey;

  ChatService(this.apiKey);

  Future<String> getAssistantResponse(String query) async {
    const url = "https://api.groq.com/openai/v1/chat/completions";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
        },
        body: jsonEncode({
          "messages": [
            {
              "role": "user",
              "content": query,
            }
          ],
          "model": "llama3-8b-8192",
          "temperature": 1,
          "max_tokens": 1024,
          "top_p": 1,
          "stream": false,
          "stop": null,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['choices'] != null && data['choices'].isNotEmpty) {
          return data['choices'][0]['message']['content']?.trim() ??
              "No response.";
        } else {
          return "Error: No response from the AI assistant.";
        }
      } else {
        throw Exception("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      throw Exception("Error in getAssistantResponse: $e");
    }
  }
}
