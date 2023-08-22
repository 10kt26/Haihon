import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import '../settings/settings.dart';
import '../data/data.dart';
import 'after_page.dart';
class WritePage extends StatefulWidget {
  const WritePage({super.key,required this.sheetdata,required this.receivePerson});
  final SheetData sheetdata;
  final String receivePerson;
  @override
  State<WritePage> createState() => _WritePageState();
}
class _WritePageState extends State<WritePage> {
  late final gsheets;
  late final ss;
  var sheet;
  _WriteData() async {
    gsheets = GSheets(SheetSettings.credentials);
    ss = await gsheets.spreadsheet(SheetSettings.spreadsheetId);
    sheet = ss.worksheetByTitle(SheetSettings.sheetname);
    final now = DateTime.now();
    final timeStr='${now.year}/${now.month}/${now.day} ${now.hour}:${now.minute}';
    for(int i=0;i<int.parse(widget.sheetdata.BooksNumber);i++) {
      await sheet.values.insertValue(SheetSettings.directString, row:widget.sheetdata.RowNum+i, column: SheetSettings.deliverColumn);
      //await sheet.values.insertValue("受取済", row:widget.sheetdata.RowNum+i, column: SheetSettings.receiveDoneColumn);
      await sheet.values.insertValue(widget.receivePerson, row: widget.sheetdata.RowNum+i, column: SheetSettings.receivePersonColumn);
      await sheet.values.insertValue(timeStr,row: widget.sheetdata.RowNum+i, column: SheetSettings.timeColumn);
    }
    /*
    var tempdata = await sheet.values.row(widget.sheetdata.ColumnNum);
    widget.sheetdata.ReferenceNumber=SheetSettings.referenceNumberRow-1<tempdata.length?tempdata[SheetSettings.referenceNumberRow-1]:"";
    widget.sheetdata.StudentNumber=SheetSettings.studentNumberRow-1<tempdata.length?tempdata[SheetSettings.studentNumberRow-1]:"";
    widget.sheetdata.Name=SheetSettings.nameRow-1<tempdata.length?tempdata[SheetSettings.nameRow-1]:"";
    widget.sheetdata.Deliver=SheetSettings.deliverRow-1<tempdata.length?tempdata[SheetSettings.deliverRow-1]:"";
    widget.sheetdata.ReceiveDone=SheetSettings.receiveDoneRow-1<tempdata.length?tempdata[SheetSettings.receiveDoneRow-1]:"";
    widget.sheetdata.BooksNumber=SheetSettings.booksNumberRow-1<tempdata.length?tempdata[SheetSettings.booksNumberRow-1]:"冊数異常";
    widget.sheetdata.Cancel=SheetSettings.cancelRow-1<tempdata.length?tempdata[SheetSettings.cancelRow-1]:"";
    widget.sheetdata.Remark=SheetSettings.remarkRow-1<tempdata.length?tempdata[SheetSettings.remarkRow-1]:"";
    widget.sheetdata.ReceivePerson=SheetSettings.receivePersonRow-1<tempdata.length?tempdata[SheetSettings.receivePersonRow-1]:"";
    widget.sheetdata.Time=SheetSettings.timeRow-1<tempdata.length?tempdata[SheetSettings.timeRow-1]:"";
    for(int i=1;i<(int.tryParse(widget.sheetdata.BooksNumber)??0);i++){
      tempdata = await sheet.values.row(widget.sheetdata.ColumnNum+i);
      widget.sheetdata.Cancel+=SheetSettings.cancelRow-1<tempdata.length?tempdata[SheetSettings.cancelRow-1]:"";
      widget.sheetdata.Remark+=SheetSettings.remarkRow-1<tempdata.length?tempdata[SheetSettings.remarkRow-1]:"";
    }
     */
    widget.sheetdata.ReceivePerson=widget.receivePerson;
    widget.sheetdata.Time=timeStr;
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AfterPage(sheetdata:widget.sheetdata)),
    );
    }
  @override
  void initState() {
    _WriteData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("問合中...",style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: const Center(
        child:SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Color(SheetSettings.myThemeColor))),
        ),
      ),
    );
  }
}