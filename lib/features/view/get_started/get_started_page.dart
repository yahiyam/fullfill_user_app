import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../auth/auth_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(250, 75, 12, 0.8),
              Color.fromRGBO(250, 75, 12, 0.9),
              Color.fromRGBO(250, 74, 12, 1),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Wrap(
                direction: Axis.vertical,
                spacing: 50,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: yWhiteColor,
                    child: Container(
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(yAppLogo),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    yAppName,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  transform: Matrix4.translationValues(220, 150, 0)
                    ..rotateZ(10 * 0.0174533),
                  child: Image.asset(ySplashMale),
                ),
                Container(
                  height: 250,
                  width: 230,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(251, 115, 66, 0),
                        Color.fromRGBO(250, 74, 12, 1),
                      ],
                    ),
                  ),
                  transform: Matrix4.translationValues(210, 200, 0)
                    ..rotateZ(10 * 0.0174533),
                ),
                Container(
                  height: 410,
                  transform: Matrix4.translationValues(-85, 80, 0)
                    ..rotateZ(-3 * 0.0174533),
                  child: Image.asset(ySplashFemale),
                ),
                Container(
                  height: 250,
                  width: 400,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(251, 115, 66, 0),
                        Color.fromRGBO(235, 96, 46, 0.4),
                        Color.fromRGBO(250, 74, 12, 1),
                      ],
                    ),
                  ),
                  transform: Matrix4.translationValues(-19, 250, 0)
                    ..rotateZ(-3 * 0.0174533),
                ),
              ],
            ),
            Align(
              widthFactor: 1.4,
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AuthPage()));
                },
                icon: const Icon(
                  Icons.navigate_next_rounded,
                  size: 40,
                  color: ySplashTextColor,
                ),
                label: const Text(
                  'Get started',
                  style: TextStyle(
                    fontSize: 40,
                    color: ySplashTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
