import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:todoapp/Home-view/utils.dart';

class todo_tile_widget extends StatefulWidget {
  const todo_tile_widget({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.status,
    Key? key,
  }) : super(key: key);
  final String title;
  final String description;
  final String dateTime;
  final bool status;

  @override
  State<todo_tile_widget> createState() => _todo_tile_widgetState();
}

class _todo_tile_widgetState extends State<todo_tile_widget> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (ischecked == false) {
                      ischecked = true;
                      print(ischecked);
                    } else {
                      ischecked = false;
                      print(ischecked);
                    }
                  });
                },
                child: Icon(
                  widget.status
                      ? Icons.check_circle_outline
                      : Icons.check_circle_rounded,
                  color: customColor(date: widget.dateTime),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: customColor(date: 'appbarcolor'),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      widget.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.notifications,
                    size: 16.0,
                    color: customColor(date:widget.dateTime),
                  ),
                  Text(
                    widget.dateTime,
                    style: TextStyle(
                      color: customColor(date: widget.dateTime),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
