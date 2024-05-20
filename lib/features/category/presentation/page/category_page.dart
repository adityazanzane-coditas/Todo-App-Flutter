import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryCreationScreenState createState() => _CategoryCreationScreenState();
}

class _CategoryCreationScreenState extends State<CategoryPage> {
  final TextEditingController _categoryNameController = TextEditingController();
  Color? _selectedColor;
  String? _selectedIcon = 'Choose icon';

  final List<Color> _colors = const [
    Color(0xffC9CC41),
    Color(0xff66CC41),
    Color(0xff41CCA7),
    Color(0xff4181CC),
    Color(0xff41A2CC),
    Color(0xffCC8441),
    Color(0xff9741CC),
    Color(0xffCC4173),
    Color(0xffea4335),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Create new category',
            style: getLato(FontWeight.w700, 20, whiteTextColour),
          ),
        ),
        backgroundColor: const Color(0xff121212),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category name:',
              style: getLato(FontWeight.w400, 16, whiteTextColour),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: TextField(
                controller: _categoryNameController,
                decoration: InputDecoration(
                  hintText: 'Category name',
                  hintStyle:
                      getLato(FontWeight.w400, 16, const Color(0xffAFAFAF)),
                  filled: true,
                  fillColor: const Color(0xff1D1D1D),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Color(0xff979797)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                style: getLato(FontWeight.w400, 16, whiteTextColour),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Category icon:',
              style: getLato(FontWeight.w400, 16, whiteTextColour),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedIcon = 'Icon Picked';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff444444),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                _selectedIcon ?? 'Choose icon',
                style: getLato(FontWeight.w400, 12, whiteTextColour),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Category color:',
              style: getLato(FontWeight.w400, 16, whiteTextColour),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _colors.map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12.0),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: color,
                        child: _selectedColor == color
                            ? const Icon(Icons.check, color: Colors.white)
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Expanded(flex: 9, child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                          color: const Color(0xff121212),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Cancel',
                          style: getLato(
                              FontWeight.w400, 16, const Color(0xff8687E7)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff8687E7)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Create Category',
                          style: getLato(FontWeight.w400, 16, whiteTextColour),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
