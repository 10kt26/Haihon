import 'package:flutter/material.dart';
import '../data/data.dart';
import '../widget/title_widget.dart';
import '../widget/contents_widget.dart';
import '../settings/settings.dart';
import 'input_page.dart';
class AfterPage extends StatelessWidget {
  const AfterPage({super.key, required this.sheetdata});

  final SheetData sheetdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("受取後確認",style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              /*
              const TitleWidget(title: '受取後確認',

              ),
               */
              ContentsWidget(
                columnNum: SheetSettings.referenceNumberColumn,
                kind: '申込番号',

                dataElement: sheetdata.ReferenceNumber,
              ),
              ContentsWidget(
                columnNum: SheetSettings.studentNumberColumn,
                kind: '学生証番号',
                dataElement: sheetdata.StudentNumber,
              ),
              ContentsWidget(
                columnNum: SheetSettings.nameColumn,
                kind: '名前',
                dataElement: sheetdata.Name,
              ),
              ContentsWidget(
                columnNum: SheetSettings.deliverColumn,
                kind: '直接or配送',
                dataElement: sheetdata.Deliver,
              ),
              ContentsWidget(
                columnNum: SheetSettings.booksNumberColumn,
                kind: '冊数',
                dataElement: sheetdata.BooksNumber,
              ),
              ContentsWidget(
                columnNum: SheetSettings.receivePersonColumn,
                kind: "受取人",
                dataElement: sheetdata.ReceivePerson,
              ),
              const SizedBox(
                height: 10,
              ),
        SizedBox(
            height: 50,
            width:300,
            child:
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(SheetSettings.myThemeColor),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const InputPage()),
                          (_) => false);
                },
                child: const Text('終了',style: TextStyle(
                  color: Colors.white,
                ),),
              ),
        )
            ]
        ),
      ),
    );
  }
}