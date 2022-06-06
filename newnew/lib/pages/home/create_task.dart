import 'package:flutter/material.dart';
import 'package:newnew/pages/home/add_note.dart';
import 'package:newnew/pages/my_functions.dart';

const Color color = Color(0xFF5D2D4C);

class CreateTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
              const ColorScheme.light(primary: color, onPrimary: Colors.white),
          textTheme: const TextTheme(
            caption: TextStyle(fontSize: 18),
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Card(
              elevation: 0,
              shadowColor: Colors.purple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2025),
                onDateChanged: (value) {
                  bottomSheet(context, AddNote(date: value))
                      .then((value) => {if (value[0]) Navigator.pop(context)});
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
