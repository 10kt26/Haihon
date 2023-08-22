import 'package:flutter/material.dart';
import '../pages/input_page.dart';
class ReturnWidget extends StatelessWidget {
  const ReturnWidget({
    super.key
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('まだ受取対応は完了していません'),
      content: const Text('本当に戻りますか'),
      actions: <Widget>[
        GestureDetector(
          child: const Text('いいえ'),
          onTap: () {Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: const Text('はい'),
          onTap: () {Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const InputPage()),
                  (_) => false);
            },
        )
      ],
    );
  }
}