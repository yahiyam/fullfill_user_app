import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/common_button.dart';
import 'package:provider/provider.dart';

import 'providers/splash_provider.dart';

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
                    backgroundColor: Colors.white,
                    child: Container(
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/icon.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'FULLFILL',
                    style: TextStyle(
                      fontSize: 65,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      letterSpacing: -1.95,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  transform: Matrix4.translationValues(220, 150, 0)
                    ..rotateZ(10 * 0.0174533),
                  child: Image.asset('assets/malePerson.png'),
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
                  child: Image.asset('assets/femalePerson.png'),
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
            CommonButton(
              isWhite: true,
              title: 'Get started',
              onTap: () {
                // Navigate to the auth page
                Navigator.pushNamed(context, '/auth');
                // Dismiss the splash screen
                final splashProvider = Provider.of<SplashProvider>(
                  context,
                  listen: false,
                );
                splashProvider.markSplashAsShown();
              },
            ),
          ],
        ),
      ),
    );
  }
}
