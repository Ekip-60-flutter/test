import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:newnew/shared/widgets/custom_text.dart';

class CardDate extends StatelessWidget {
  int weekday;
  int day;
  bool isToday;
  bool isClick;
  CardDate(
      {required this.weekday,
      required this.day,
      required this.isToday,
      required this.isClick});

  Color todayColor = const Color(0xFFff833B);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 75,
          width: 75,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: isToday
                  ? todayColor
                  : (isClick
                      ? todayColor.withOpacity(0.2)
                      : Colors.transparent),
              border: Border.all(color: Colors.white30),
              borderRadius: BorderRadius.circular(24)),
          child: Tab(
            icon: CustomText(
              text: '${Weekday.values[weekday - 1].name}',
              color: Colors.white54,
            ),
            child: CustomText(
              text: '$day',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

enum Weekday { Pzt, Sal, Cars, Prs, Cm, Cmt, Pzr }
