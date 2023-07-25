import 'package:flutter_share/flutter_share.dart';
import '../../../constants/text_strings.dart';

class AppServices {
  static Future<void> shareApp() async {
    await FlutterShare.share(
      title: 'Share App',
      text: yAppShareMessage,
      linkUrl: yAppPlayStoreLink,
    );
  }
}
