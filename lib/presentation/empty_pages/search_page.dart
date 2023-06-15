import 'package:flutter/material.dart';

import '../widgets/common_widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(showTextField: true),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: EmptyPageMessege(
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
