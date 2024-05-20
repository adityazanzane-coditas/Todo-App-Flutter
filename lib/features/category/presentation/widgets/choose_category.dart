import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';
import 'package:todo_app/features/category/presentation/page/category_page.dart';

class ChooseCategoryDialog extends StatelessWidget {
  const ChooseCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: const Color(0xff363636),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text('Choose Category',
                  style: getLato(FontWeight.w700, 16, whiteTextColour)),
            ),
            const Divider(
              color: Color(0xff979797),
              height: 0,
              indent: 8,
              endIndent: 8,
            ),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 0,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                _CategoryItem(
                    icon: 'assets/icons/bread.svg',
                    label: 'Grocery',
                    color: Color(0xffCCFF80)),
                _CategoryItem(
                    icon: 'assets/icons/work.svg',
                    label: 'Work',
                    color: Color(0xffFF9680)),
                _CategoryItem(
                    icon: 'assets/icons/sport.svg',
                    label: 'Sport',
                    color: Color(0xff80FFFF)),
                _CategoryItem(
                    icon: 'assets/icons/design (1) 1design.svg',
                    label: 'Design',
                    color: Color(0xff80FFD9)),
                _CategoryItem(
                    icon: 'assets/icons/school.svg',
                    label: 'University',
                    color: Color(0xff809CFF)),
                _CategoryItem(
                    icon: 'assets/icons/megaphone 1social.svg',
                    label: 'Social',
                    color: Color(0xffFF80EB)),
                _CategoryItem(
                    icon: 'assets/icons/music.svg',
                    label: 'Music',
                    color: Color(0xffFC80FF)),
                _CategoryItem(
                    icon: 'assets/icons/heart.svg',
                    label: 'Health',
                    color: Color(0xff80FFA3)),
                _CategoryItem(
                    icon: 'assets/icons/video.svg',
                    label: 'Movie',
                    color: Color(0xff80D1FF)),
                _CategoryItem(
                    icon: 'assets/icons/homeIcon.svg',
                    label: 'Home',
                    color: Color(0xffFFCC80)),
                _CategoryItem(
                    icon: 'assets/icons/addIcon.svg',
                    label: 'Create New',
                    color: Color(0xff80FFD1)),
              ].map((category) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(category.label);
                  },
                  child: category,
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff8687E7)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CategoryPage();
                        });
                  },
                  child: Text('Add Category',
                      style: getLato(FontWeight.w400, 16, whiteTextColour)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;

  const _CategoryItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
          child: SvgPicture.asset(
            icon,
            width: 32,
            height: 32,
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: getLato(FontWeight.w500, 14, whiteTextColour)),
      ],
    );
  }
}
