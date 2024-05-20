import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              SvgPicture.asset('assets/icons/logo.svg'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 117.0),
                child: Text(
                  'UpTodo',
                  style: getLato(FontWeight.w700, 40, whiteTextColour),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
