import 'package:gdtsapp/network/local/cash_helper.dart';
import 'package:gdtsapp/screens/login/login_screen.dart';
import 'package:gdtsapp/shared/components/component.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel(
      {@required this.image, @required this.title, @required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assete/images/gdts.png',
        title: 'Glucose Detector Through Skin',
        body: 'welcome dear user You are now using measure sugar level application.   Follow the following guidelines. ',
        ),
    BoardingModel(
        image: 'assete/images/',
        title: 'What the application does        ',
        body: 'The application measures blood sugar with a new technology through skin.'
    ),
    BoardingModel(
        image: 'assete/images/',
        title: 'Use instructions                          ',
        body: 'To start the blood sugar test, follow the usage instructions.',)
  ];

  var boardingController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: const Text('SKIP',style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                controller: boardingController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                      dotColor: Colors.black,
                      dotHeight: 10.0,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0,
                      activeDotColor: HexColor('0d9d8d'),
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardingController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                  backgroundColor: HexColor('0d9d8d'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context, LoginScreen());
      }
    });
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Expanded(
        child: Image.asset(model.image),
      ),
      const SizedBox(
        height: 30.0,
      ),
      Text(
        model.title,
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
      const SizedBox(
        height: 15.0,
      ),
      Text(
        model.body,
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      const SizedBox(
        height: 15.0,
      ),
    ],
  );
}
