import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/empty_page_message.dart';
import 'package:fullfill_user_app/utils/functions/simple_app_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSimpleAppBar(context, title: 'Search Page'),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: EmptyPageMessage(
                icon: Icons.search_rounded,
                mainTitle: 'Item not found',
                subTitle: 'Try searching the item with\na different keyword.',
              ),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
