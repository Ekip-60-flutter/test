import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newnew/pages/home/home_bloc.dart';
import 'package:newnew/pages/home/note_item.dart';
import 'package:newnew/shared/widgets/custom_text.dart';

class AddNote extends StatefulWidget {
  AddNote({Key? key, required this.date}) : super(key: key);

  DateTime date;

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final NoteItem _noteItem = NoteItem();

  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  double buttonHeight = 50;
  Color rejectColor = Colors.grey;
  Color acceptColor = const Color(0xFF5D2D4C);

  @override
  Widget build(BuildContext context) {
    final HomeBloc _homeBloc = BlocProvider.of<HomeBloc>(context);

    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: CustomText(
              text: DateFormat('MMMEd', 'tr').format(widget.date),
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
              fontSize: 20,
            ),
          ),
          TextField(
            controller: title,
            decoration: InputDecoration(
                hintText: 'Başlık',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            controller: desc,
            maxLines: 5,
            decoration: InputDecoration(
                hintText: 'Açıklama',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: buttonHeight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(rejectColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ))),
                    child: CustomText(
                      text: 'Vazgeç',
                      color: acceptColor,
                      fontWeight: FontWeight.bold,
                    ),
                    onPressed: () {
                      Navigator.pop(context, [false]);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: buttonHeight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(acceptColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ))),
                    child: CustomText(
                      text: 'Kaydet',
                      color: rejectColor,
                      fontWeight: FontWeight.bold,
                    ),
                    onPressed: () {
                      _noteItem.date =
                          DateFormat('yyyy-MM-dd').format(widget.date);
                      _noteItem.title = title.text;
                      _noteItem.desc = desc.text;
                      _homeBloc.noteItem = _noteItem;
                      _homeBloc.add(EventHome.AddNote);
                      Navigator.pop(context, [true]);
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
