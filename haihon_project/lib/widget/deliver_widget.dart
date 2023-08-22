import 'package:flutter/material.dart';
import '../data/data.dart';
import 'person_select_widget.dart';
class DeliverWidget extends StatelessWidget {
  const DeliverWidget({
    super.key,required this.sheetdata
  });
  final SheetData sheetdata;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('配送予定です'),
      content: const Text('直接に変更しますか'),
      actions: <Widget>[
        GestureDetector(
          child: const Text('変更しない'),
          onTap: () {Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: const Text('変更する'),
          onTap: () {showDialog<void>(
              context: context,
              builder: (_) {
                return PersonSelectWidget(sheetdata: sheetdata,);
              });},
        )
      ],
    );
  }
}