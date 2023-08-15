import 'package:chatgpt/presentation/widgets/changeTheme_iconButton.dart';
import 'package:flutter/material.dart';

import '../../config/theme/fonts.dart';
import '../widgets/drawer.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatGPT', style: pageTitle(context)),
        actions: [ChangeThemeIconButton()],
      ),
      drawer: MyDrawer(),
      body: ChatScreen(),
    );
  }
}
