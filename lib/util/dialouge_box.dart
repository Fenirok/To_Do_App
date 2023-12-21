import 'package:flutter/material.dart';
import 'package:todoapp/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final control;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.control,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //gets user input
            TextField(
              controller: control,
              decoration:
              InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(16.0),
                ),
                label: const Text(
                  "Add New Task",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            //buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  text: "Save",
                  onpressed: onSave,
                ),
                const Spacer(),
                MyButton(
                  text: "Cancel",
                  onpressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
