import 'package:flutter/material.dart';

import 'debouncer.dart';

class DebounceButton extends StatefulWidget {
  String title;
  Function(int totalClick) onTap;
  Duration delay;

  DebounceButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.delay = const Duration(milliseconds: 1000)});

  @override
  State<DebounceButton> createState() => _DebounceButtonState();
}

class _DebounceButtonState extends State<DebounceButton> {
  late Debouncer debouncer = Debouncer(delay: widget.delay);
  var totalClick = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        totalClick++;
        debouncer.run(() {
          widget.onTap(totalClick);
          totalClick = 0;
        });
      },
      child: Text(widget.title),
    );
  }
}
