import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';
import 'package:todo_app/features/home/widgets/calendar_widget.dart';

Widget CustomNavigationBar() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 38 / 2),
    color: const Color(0xff363636),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            print('Index button tapped');
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/home-2hpHome.svg'),
              const SizedBox(height: 8),
              Text(
                'Index',
                style: getLato(FontWeight.w400, 12, whiteTextColour),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            const DailyCalendar();
            print('Calendar button tapped');
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/calendarhpCalendar.svg'),
              const SizedBox(height: 8),
              Text(
                'Calendar',
                style: getLato(FontWeight.w400, 12, whiteTextColour),
              ),
            ],
          ),
        ),
        const SizedBox(width: 6),
        GestureDetector(
          onTap: () {
            print('Focus button tapped');
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/clockhpClock.svg'),
              const SizedBox(height: 8),
              Text(
                'Focus',
                style: getLato(FontWeight.w400, 12, whiteTextColour),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            print('Profile button tapped');
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/userhpProfile.svg'),
              const SizedBox(height: 8),
              Text(
                'Profile',
                style: getLato(FontWeight.w400, 12, whiteTextColour),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
