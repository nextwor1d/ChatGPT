import '../../config/api_key.dart';
import 'package:flutter/material.dart';

import '../../config/theme/fonts.dart';

class ChangeAPIKey extends StatefulWidget {
  const ChangeAPIKey({
    super.key,
  });

  @override
  State<ChangeAPIKey> createState() => _MyAccountState();
}

class _MyAccountState extends State<ChangeAPIKey> {
  TextEditingController controller = TextEditingController();
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      horizontalTitleGap: 10,

      // Change API Key
      title: GestureDetector(
        child: Text('Change API Key',
            textAlign: TextAlign.center, style: changeAPI(context)),
        onTap: () => showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        controller.clear();
                        setState(() => errorText = null);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      )),
                  TextButton(
                      onPressed: () {
                        if (controller.text.trim().isEmpty ||
                            controller.text.trim().length < 10) {
                          setState(() => errorText = 'Invalid API Key');
                        } else if (controller.text.isNotEmpty) {
                          APIConfig.updateAPIKey(controller.text);
                          setState(() => errorText = null);
                          controller.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Change')),
                ],
                content: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Enter Your API Key',
                    errorText: errorText,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
