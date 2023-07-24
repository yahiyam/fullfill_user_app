import 'package:flutter/material.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/constants/image_strings.dart';

class AuthFlexibleSpaceBar extends StatelessWidget {
  const AuthFlexibleSpaceBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      title: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: yWhiteColor,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    commonColor,
                    BlendMode.srcIn,
                  ),
                  child: Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(yAppLogo),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 100,
                  transform: Matrix4.translationValues(30, 95, 0)
                    ..rotateZ(10 * 0.0174533),
                  child: Image.asset(ySplashFemale),
                ),
                Container(
                  height: 100,
                  transform: Matrix4.translationValues(-40, 115, 0)
                    ..rotateZ(-10 * 0.0174533),
                  child: Image.asset(ySplashMale),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
