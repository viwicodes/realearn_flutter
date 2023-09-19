import 'package:flutter/material.dart';
import 'package:relearn/utils/my_buttons.dart';

// ignore: must_be_immutable
class DialogueBox extends StatelessWidget {
  dynamic controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogueBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Type todo",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "Save",
                  onPressed: () {
                    onSave();
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                MyButton(
                  text: "Cancel",
                  onPressed: () {
                    onCancel();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
