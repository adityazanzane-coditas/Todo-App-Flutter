import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/navigations/routes/app_router.gr.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _totalPages = 3;

  final List<String> _imagePaths = [
    'assets/images/Group 182introTab1.svg',
    'assets/images/Frame 162introTab2.svg',
    'assets/images/Frame 161introTab3.svg',
  ];

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _totalPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 4.0,
      width: isActive ? 30 : 30,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_currentPage > 0) {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Text(
                        'SKIP',
                        style: getLato(
                            FontWeight.w400, 16, const Color(0xff7A7A7A)),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    height: 600.0,
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        _buildPage(
                          title: 'Manage your tasks',
                          description:
                              'You can easily manage all of your daily\ntasks in DoMe for free',
                          imagePath: _imagePaths[0],
                        ),
                        _buildPage(
                          title: 'Create daily routine',
                          description:
                              'In Uptodo you can create your\npersonalized routine to stay productive',
                          imagePath: _imagePaths[1],
                        ),
                        _buildPage(
                          title: 'Organize your tasks',
                          description:
                              'You can organize your daily tasks by\nadding your tasks into separate categories',
                          imagePath: _imagePaths[2],
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_currentPage > 0) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          }
                        },
                        child: Text(
                          'BACK',
                          style: getLato(
                              FontWeight.w400, 16, const Color(0xff7A7A7A)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            backgroundColor:
                                MaterialStatePropertyAll(elevatedButtonColour),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              
                            ),
                            
                          ),
                          onPressed: () {
                            if (_currentPage == _totalPages - 1) {
                              AutoRouter.of(context).push(
                                  const HomeRoute()); 
                            } else if (_currentPage < _totalPages - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            }
                          },
                          child: Text(
                            _currentPage == _totalPages - 1
                                ? 'GET STARTED'
                                : 'NEXT',
                            style:
                                getLato(FontWeight.w400, 16, whiteTextColour),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPage(
      {required String title,
      required String description,
      required String imagePath}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 81.0),
          child: Center(
            child: SvgPicture.asset(imagePath),
          ),
        ),
        const SizedBox(
          height: 51,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicator(),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 53.0),
          child:
              Text(title, style: getLato(FontWeight.w700, 32, whiteTextColour)),
        ),
        const SizedBox(
          height: 42,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Center(
            child: Text(
              description,
              style: getLato(FontWeight.w400, 16, whiteTextColour),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 80)
      ],
    );
  }
}
