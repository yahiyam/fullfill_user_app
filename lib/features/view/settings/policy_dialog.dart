import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PolicyDialog extends StatelessWidget {
  PolicyDialog({
    super.key,
    required this.mdFileName,
  }) : assert(mdFileName.contains('.md'),
            'The file must contain the .md extension');

  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<String>(
              future: Future.delayed(const Duration(seconds: 1)).then((value) {
                return rootBundle.loadString(mdFileName);
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(data: snapshot.data!);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("CLOSE"),
          ),
        ],
      ),
    );
  }
}
