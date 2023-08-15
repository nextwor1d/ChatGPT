import 'package:flutter/material.dart';
import '../../domain/usecases/ai_usecase.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputController = TextEditingController();
    FocusNode focusNode = FocusNode();

    void sendMessage() {
      final message = inputController.text.trim();
      if (message.isNotEmpty) {
        openAI(context, message);
        inputController.clear();
      }
    }

    return Container(
      constraints: BoxConstraints(maxHeight: 150),
      child: TextField(
        controller: inputController,
        maxLines: null,
        focusNode: focusNode,
        autofocus: false,
        onTapOutside: (event) => focusNode.unfocus(),
        textInputAction: TextInputAction.newline,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: 'Send a message...',
          isDense: true,
          suffixIcon: IconButton(
              icon: Icon(Icons.send_rounded),
              iconSize: 25,
              onPressed: () => inputController.text.trim().isNotEmpty
                  ? sendMessage()
                  : null),
        ),
      ),
    );
  }
}
