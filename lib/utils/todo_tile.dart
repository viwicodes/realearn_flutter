import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodloTile extends StatelessWidget {
  final String name;
  final bool check;
  Function(bool?)? onchange;
  Function(BuildContext)? deleteFunction;

  TodloTile({
    super.key,
    required this.name,
    required this.check,
    required this.onchange,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: const Color(0xFFEF9A9A),
              borderRadius: BorderRadius.circular(24),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: check,
                onChanged: onchange,
              ),
              // task name
              Text(
                name.toUpperCase(),
                style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  decoration:
                      check ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
