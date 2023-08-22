import 'package:flutter/material.dart';
import '../data/data.dart';
import '../pages/write_page.dart';
class PersonSelectWidget extends StatelessWidget {
  const PersonSelectWidget({
    super.key,required this.sheetdata
  });
  final SheetData sheetdata;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('受取人は誰ですか'),
      children: [
        SimpleDialogOption(
          child: const Text('本人'),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => WritePage(sheetdata:sheetdata,receivePerson: '本人',)),
                    (_) => false);
          },
        ),
        SimpleDialogOption(
          child: const Text('代理人(保護者等)'),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => WritePage(sheetdata:sheetdata,receivePerson: '代理人(保護者等)',)),
                    (_) => false);
          },
        ),
        SimpleDialogOption(
          child: const Text('戻る'),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        )
      ],
    );
  }
}