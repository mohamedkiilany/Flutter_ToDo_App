import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final bool? TaskCompleted;
  final String? TaskName;
  Function(bool?)? OnChanged;
  Function(BuildContext?) deleteFunction;

  ToDoTile({
    super.key,
    required this.TaskCompleted,
    required this.TaskName,
    required this.OnChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 177, 166, 64),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Checkbox(
                  value: TaskCompleted,
                  onChanged: OnChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  TaskName!,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    wordSpacing: 1,
                    decoration: TaskCompleted!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
