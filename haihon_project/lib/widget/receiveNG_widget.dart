import 'package:flutter/material.dart';
class ReceiveNGWidget extends StatelessWidget {
  const ReceiveNGWidget({
    super.key,required this.note
  });
  final String note;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('連絡事項あり'),
      content: note=="受取済の可能性"?const Text("受取済の可能性があります。スプシを確認してください。アプリから受取対応できません。"):note=="冊数異常"?const Text("番号を確認してください。"):const Text("連絡事項あり。スプシを確認してください。アプリから受取対応できません。"),
      actions: <Widget>[
        GestureDetector(
          child: const Text('OK'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}