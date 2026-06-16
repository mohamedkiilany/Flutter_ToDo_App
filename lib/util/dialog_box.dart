import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final mycontroller;
  VoidCallback onsave;
  VoidCallback oncancel;
  DialogBox({
    super.key,
    required this.mycontroller,
    required this.oncancel,
    required this.onsave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: mycontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hint: Text("what`s in your mind"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onsave),
                Padding(padding: EdgeInsets.all(2)),
                MyButton(text: "cancel", onPressed: oncancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
