import 'package:flutter/material.dart';
import 'package:user_app/features/view/settings/policy_dialog.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 50,
                  children: [
                    Text(
                      yAppName,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  PolicyDialog(mdFileName: yAppPrivacy),
                            );
                          },
                          icon: const Icon(
                            Icons.privacy_tip_outlined,
                            size: 24,
                          ),
                          label: const Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  PolicyDialog(mdFileName: yAppTerms),
                            );
                          },
                          icon: const Icon(
                            Icons.sticky_note_2_outlined,
                            size: 24,
                          ),
                          label: const Text(
                            'Terms and Conditions',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
                transform: Matrix4.translationValues(-19, 250, 0)
                  ..rotateZ(-3 * 0.0174533),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
