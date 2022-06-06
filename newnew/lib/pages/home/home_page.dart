import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newnew/pages/home/add_note.dart';
import 'package:newnew/pages/home/create_task.dart';
import 'package:newnew/pages/home/home_bloc.dart';
import 'package:newnew/pages/home/note_item.dart';
import 'package:newnew/pages/login/login_page.dart';
import 'package:newnew/pages/login/login_process.dart';
import 'package:newnew/pages/my_functions.dart';
import 'package:newnew/shared/widgets/card_date.dart';
import 'package:newnew/shared/widgets/custom_text.dart';
import 'package:newnew/shared/widgets/task_card.dart';

const Color color = Color(0xFF5D2D4C);
const Color cardColor = Color(0xFFfCf4EA);
const double upCardMargin = 24;

DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));

DateTime currentDate = DateTime.now();

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LoginProcess _loginProcess = LoginProcess();

  late int clickIndex = -1;

  changeDate(int index) {
    setState(() {
      currentDate = yesterday.add(Duration(days: index));
      clickIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: Drawer(
        child: TextButton(
          child: CustomText(text: 'Çıkış Yap'),
          onPressed: () {
            _loginProcess.removeData('username');
            _loginProcess.writeLogin(false);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: height * 40,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)),
                child: Container(
                  color: color,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(top: 24, left: 12),
                        child: TextButton.icon(
                          icon: const Icon(
                            Icons.add_circle_outline,
                            color: Colors.white54,
                            size: 40,
                          ),
                          label: CustomText(
                            text: 'Görev Oluştur',
                            color: Colors.white54,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateTask()));
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: upCardMargin),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: CustomText(
                                    text: 'Merhaba',
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 3,
                                  )),
                              FutureBuilder(
                                future: _loginProcess.readData('username'),
                                builder: (context, snapshot) {
                                  return Container(
                                    margin:
                                        const EdgeInsets.only(top: 6, left: 3),
                                    alignment: Alignment.centerLeft,
                                    child: CustomText(
                                      text: snapshot.data
                                          .toString()
                                          .toUpperCase(),
                                      color: const Color(0xFFff823a),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      letterSpacing: 3,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            bottom: upCardMargin,
                            left: upCardMargin,
                            right: upCardMargin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            4,
                            (index) => GestureDetector(
                              onTap: () {
                                changeDate(index);
                                context.read<HomeBloc>().currentDate =
                                    DateFormat('yyyy-MM-dd')
                                        .format(currentDate);
                                context
                                    .read<HomeBloc>()
                                    .add(EventHome.GetAllBySort);
                              },
                              onDoubleTap: () {
                                changeDate(index);
                                bottomSheet(
                                    context, AddNote(date: currentDate));
                              },
                              child: CardDate(
                                weekday: yesterday
                                    .add(Duration(days: index))
                                    .weekday,
                                day: yesterday.add(Duration(days: index)).day,
                                isToday: index == 1,
                                isClick: index == clickIndex,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, List<NoteItem>>(
                builder: (context, _items) {
                  return Container(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 12, top: 24),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              CustomText(
                                  text: DateFormat("d MMM", "tr")
                                      .format(currentDate),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              CustomText(
                                text: ' - Bugün için notlarım',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            addAutomaticKeepAlives: false,
                            addRepaintBoundaries: false,
                            addSemanticIndexes: false,
                            shrinkWrap: true,
                            itemCount: _items.length,
                            itemBuilder: (context, index) {
                              return TaskCard(noteItem: _items[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
