import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psiapp/presentation/components/structure_cards.dart';
import 'package:psiapp/presentation/screens/auth_screen.dart';
import 'package:psiapp/utils/colors.dart';

class TutorialScreen extends StatefulWidget {
  static String id = 'tutorial';

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;

  @override
  void dispose() {
    //Quando a pagina for descartada
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: <Widget>[
                StructureCards(
                  caminhoImagem: 'assets/images/fashion.png',
                  titulo: 'Page 0',
                  subititulo:
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                ),
                StructureCards(
                  caminhoImagem: 'assets/images/fashion.png',
                  titulo: 'Page 1',
                  subititulo:
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                ),
                StructureCards(
                  caminhoImagem: 'assets/images/fashion.png',
                  titulo: 'Page 2',
                  subititulo:
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(flex: 1, child: Text('')),
                Expanded(
                  flex: 1,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: _currentPage.toDouble(),
                    decorator: DotsDecorator(
                      colors: [Colors.grey, Colors.grey, Colors.grey],
                      activeColors: [kMainColor, kMainColor, kMainColor],
                      size: const Size.square(18.0),
                      activeSize: const Size(50, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (_currentPage < 2) {
                          _currentPage += 1;
                          _pageController.animateToPage(
                            _currentPage,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        } else {
                          Navigator.pushNamed(context, AuthScreen.id);
                        }
                      });
                    },
                    child: _currentPage == 2
                        ? Text(
                            'Get Start',
                            style: TextStyle(
                              color: kMainColor,
                              fontStyle: GoogleFonts.montserrat().fontStyle,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          )
                        : Text(
                            'Next',
                            style: TextStyle(
                              color: kMainColor,
                              fontStyle: GoogleFonts.montserrat().fontStyle,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
