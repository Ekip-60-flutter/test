import 'package:flutter/material.dart';
import 'package:kurulum_demo/custom-widgets/my_text.dart';

class HomePage extends StatefulWidget {
  String name;
  HomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Notes> notes = [];

  @override
  void initState() {
    super.initState();
    addNote();
  }

  addNote() {
    for (int i = 1; i < 10; i++) {
      notes.add(Notes(
          title: 'Deneme $i', desc: 'Açıklama kısmı $i', date: DateTime.now()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: MyText(
          text: "Hoşgeldin ${widget.name}",
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF59cdc4),
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFF1e535c), // Yuvarlak renk
                  onPrimary: Colors.white, // Yuvarlak içi
                ),
                textTheme: const TextTheme(
                  caption: TextStyle(
                      fontSize: 18,
                      fontFamily: 'PatrickHand'), // calendar numaraları
                ),
              ),
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2025),
                onDateChanged: (value) {},
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFF1e535c),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, bottom: 5),
                    child: MyText(
                      text: 'Your Task For Today:',
                      fontSize: 22,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: notes.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Chip(
                                label: MyText(
                                  text:
                                      '${notes[i].date.hour}:${notes[i].date.minute}',
                                  color: const Color(0xFF1e535c),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          title:
                              MyText(text: '${notes[i].title}', fontSize: 18),
                          subtitle: MyText(text: '${notes[i].desc}'),
                          trailing: MyText(
                            text: '${notes[i].date.day}',
                            fontSize: 16,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Notes {
  String? title;
  String? desc;
  DateTime date;
  Notes({this.title, this.desc, required this.date});
}
