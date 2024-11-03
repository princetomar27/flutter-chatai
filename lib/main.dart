import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'constants/theme.dart';
import 'providers/chat_provider.dart';
import 'ui/chats/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiKey = dotenv.env['GROQ_API_KEY'] ?? '';
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(
            apiKey,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'ChatGPT Clone',
        debugShowCheckedModeBanner: false,
        theme: ChatGPTTheme.lightTheme,
        darkTheme: ChatGPTTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const ChatScreen(),
      ),
    );
  }
}
