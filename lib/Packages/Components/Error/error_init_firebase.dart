import 'package:flutter/material.dart';

import '../../../util/path_icons.dart';

class ErrorInitFirebase extends StatelessWidget {
  const ErrorInitFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PathIcons.errorInitFirebase,
              const Text('errorInitFirebase'),
            ],
          ),
        ),
      ),
    );
  }
}
