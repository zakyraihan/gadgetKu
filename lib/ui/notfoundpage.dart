import 'package:flutter/cupertino.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text('PAGE NOT FOUND'),
      ),
    );
  }
}
