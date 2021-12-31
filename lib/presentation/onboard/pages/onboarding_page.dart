import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/configs/themes/palette.dart';
import 'package:flutter_starter_project/core/constants/assets_constants.dart';
import 'package:flutter_starter_project/core/constants/key_constants.dart';
import 'package:flutter_starter_project/core/di/injection.dart';
import 'package:flutter_starter_project/core/utils/services/shared_prefs.dart';
import 'package:flutter_starter_project/presentation/auth/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  static const route = '/onBoardingPage';

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final prefs = sl<SharedPrefs>();

  void _onIntroEnd() {
    Get.offAllNamed<void>(LoginPage.route);
  }

  @override
  void initState() {
    super.initState();
    prefs.putBool(KeyConstants.keyOnBoard, true);
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      descriptionPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: IntroductionScreen(
          color: Palette.primaryColor,
          globalFooter: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              key: const Key('onBoardSkip'),
              onPressed: _onIntroEnd,
              child: const Text(
                'Lets go right away!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          pages: [
            PageViewModel(
              title: 'Online Learning Platform',
              body:
                  // ignore: lines_longer_than_80_chars
                  'Choose from 100,000 online video courses with new additions published',
              image: Image.asset(
                AssetsConstants.logo,
                height: 150,
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: 'Fractional shares',
              body: 'Instead of having to buy an entire share.',
              image: Image.asset(
                AssetsConstants.logo,
                height: 150,
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: 'Fractional shares',
              body: 'Instead of having to buy an entire share.',
              image: Image.asset(
                AssetsConstants.logo,
                height: 150,
              ),
              decoration: pageDecoration,
            ),
          ],
          onDone: _onIntroEnd,
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          skip: const Text('Skip'),
          next: const Icon(Icons.arrow_forward),
          done:
              const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(12)
              : const EdgeInsets.fromLTRB(8, 4, 8, 4),
          dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22, 10),
            activeColor: Palette.primaryColor,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ),
        ),
      ),
    );
  }
}
