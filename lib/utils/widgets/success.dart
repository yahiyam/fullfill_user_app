import 'package:flutter/material.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/utils/common_button.dart';
import 'package:user_app/features/view/home/home_page.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    backgroundColor!,
                    BlendMode.darken,
                  ),
                  child: Image.asset(
                    'assets/success.gif',
                    height: 300.0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Successful !!!',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: kDarkColor,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Text(
                    'Your payment was done successfully',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: kLightColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CommonButton(
            title: 'OK',
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
