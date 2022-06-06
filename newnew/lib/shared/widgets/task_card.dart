import 'package:flutter/material.dart';
import 'package:newnew/pages/home/home_bloc.dart';
import 'package:newnew/pages/home/note_item.dart';
import 'package:newnew/shared/widgets/custom_text.dart';
import 'package:provider/src/provider.dart';

class TaskCard extends StatelessWidget {
  TaskCard({required this.noteItem});

  NoteItem noteItem;

  Color cardColor = const Color(0xFFfCf4EA);
  Color mainColor = const Color(0xFF5D2D4C);
  double fontSize = 13;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 18),
          padding: const EdgeInsets.only(left: 24),
          decoration: const BoxDecoration(
              border: Border(left: BorderSide(color: Colors.black38))),
          child: Container(
            margin: const EdgeInsets.only(top: 4, bottom: 4),
            child: Card(
              shadowColor: mainColor,
              elevation: noteItem.check! ? 0 : 5,
              color: noteItem.check! ? mainColor.withOpacity(0.3) : cardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              child: Container(
                padding: const EdgeInsets.all(3),
                child: ListTile(
                  title: Container(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: noteItem.title!.toUpperCase(),
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontStyle:
                          noteItem.check! ? FontStyle.italic : FontStyle.normal,
                      textDecoration: noteItem.check!
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Container(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: noteItem.desc,
                      fontSize: fontSize - 3,
                      color: Colors.black45,
                      fontStyle:
                          noteItem.check! ? FontStyle.italic : FontStyle.normal,
                      textDecoration: noteItem.check!
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline_outlined),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: CustomText(
                                text: 'Sil',
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.bold,
                              ),
                              content: CustomText(
                                  text: 'Notu silmek istediğine emin misin?',
                                  maxLines: 3,
                                  textAlign: TextAlign.left),
                              actions: [
                                TextButton(
                                  child: CustomText(
                                    text: 'Evet',
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    context.read<HomeBloc>().noteItem =
                                        noteItem;
                                    context
                                        .read<HomeBloc>()
                                        .add(EventHome.DeleteNote);
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: CustomText(
                                    text: 'Hayır',
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<HomeBloc>().noteItem = noteItem..check = true;
            context.read<HomeBloc>().add(EventHome.UpdateNote);
          },
          child: Container(
              padding: const EdgeInsets.only(left: 6),
              margin: const EdgeInsets.only(top: 35),
              child: const Icon(
                Icons.circle_outlined,
                color: Colors.black45,
              )),
        ),
        noteItem.check!
            ? GestureDetector(
                onTap: () {
                  context.read<HomeBloc>().noteItem = noteItem..check = false;
                  context.read<HomeBloc>().add(EventHome.UpdateNote);
                },
                child: Container(
                    padding: const EdgeInsets.only(left: 0),
                    margin: const EdgeInsets.only(top: 18),
                    child: Icon(
                      Icons.check,
                      size: 45,
                      color: mainColor,
                    )),
              )
            : Container(),
      ],
    );
  }
}
