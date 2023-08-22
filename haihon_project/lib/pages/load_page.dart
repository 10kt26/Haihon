import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import '../settings/settings.dart';
import '../data/data.dart';
import 'notfound_page.dart';
import 'check_page.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key,required this.input});
  final String input;
  @override
  State<LoadPage> createState() => _LoadPageState();
}
class _LoadPageState extends State<LoadPage> {
  late final gsheets;
  late final ss;
  var sheet;
  _loadData() async {
    gsheets = GSheets(SheetSettings.credentials);
    ss = await gsheets.spreadsheet(SheetSettings.spreadsheetId);
    sheet = ss.worksheetByTitle(SheetSettings.sheetname);
    var referenceColumn=await sheet.values.column(SheetSettings.referenceNumberColumn);
    var studentColumn=await sheet.values.column(SheetSettings.studentNumberColumn);
    var rowNum=-1;
    for(int i=0;i<referenceColumn.length;i++){
      if(widget.input==referenceColumn[i]){
        rowNum=i+1;
      }
    }
    if(rowNum==-1) {
      for (int i = 0; i < studentColumn.length; i++) {
        if (widget.input == studentColumn[i]) {
          rowNum = i + 1;
        }
      }
    }
    if(rowNum==-1){
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NotFoundPage(input:widget.input)),
      );
    }else {
      var tempdata = await sheet.values.row(rowNum);
      SheetData sheetdata=SheetData();
      sheetdata.ReferenceNumber=SheetSettings.referenceNumberColumn-1<tempdata.length?tempdata[SheetSettings.referenceNumberColumn-1]:"";
      sheetdata.StudentNumber=SheetSettings.studentNumberColumn-1<tempdata.length?tempdata[SheetSettings.studentNumberColumn-1]:"";
      sheetdata.Name=SheetSettings.nameColumn-1<tempdata.length?tempdata[SheetSettings.nameColumn-1]:"";
      sheetdata.Deliver=SheetSettings.deliverColumn-1<tempdata.length?tempdata[SheetSettings.deliverColumn-1]:"";
      sheetdata.ReceivePerson=SheetSettings.receivePersonColumn-1<tempdata.length?tempdata[SheetSettings.receivePersonColumn-1]:"";
      sheetdata.BooksNumber=SheetSettings.booksNumberColumn-1<tempdata.length?tempdata[SheetSettings.booksNumberColumn-1]:"冊数異常";
      //sheetdata.Cancel=SheetSettings.cancelColumn-1<tempdata.length?tempdata[SheetSettings.cancelColumn-1]:"";
      sheetdata.Remark=SheetSettings.remarkColumn-1<tempdata.length?tempdata[SheetSettings.remarkColumn-1]:"";
      for(int i=1;i<(int.tryParse(sheetdata.BooksNumber)??0);i++){
        tempdata = await sheet.values.row(rowNum+i);
        //sheetdata.Cancel+=SheetSettings.cancelColumn-1<tempdata.length?tempdata[SheetSettings.cancelColumn-1]:"";
        sheetdata.Remark+=SheetSettings.remarkColumn-1<tempdata.length?tempdata[SheetSettings.remarkColumn-1]:"";
      }
      sheetdata.RowNum=rowNum;
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CheckPage(sheetdata:sheetdata)),
      );
      //setState(() {});
    }
  }
  /*
  _uploadData() async {
    await sheet.values.insertValue("update", column: 1, row:1);
    loaddata="書き込み";
    setState(() {});
  }
  */
  @override
  void initState() {
    _loadData();
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