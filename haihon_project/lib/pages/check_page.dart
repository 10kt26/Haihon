import 'package:flutter/material.dart';
import '../widget/return_widget.dart';
import '../data/data.dart';
import '../widget/title_widget.dart';
import '../widget/contents_widget.dart';
import '../widget/person_select_widget.dart';
import '../widget/deliver_widget.dart';
import '../widget/receiveNG_widget.dart';
import 'input_page.dart';
import '../settings/settings.dart';
import 'write_page.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({super.key,required this.sheetdata});
  final SheetData sheetdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("受取前確認",style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body:SingleChildScrollView(
        child:Column(
          children:[
            /*
            const TitleWidget(title: '受取前確認',

            ),
             */
            ContentsWidget(
              columnNum:SheetSettings.referenceNumberColumn,
              kind: '申込番号',
              dataElement: sheetdata.ReferenceNumber,
            ),
            ContentsWidget(
              columnNum:SheetSettings.studentNumberColumn,
              kind: '学生証番号',
              dataElement: sheetdata.StudentNumber,
            ),
            ContentsWidget(
              columnNum:SheetSettings.nameColumn,
              kind: '名前',
              dataElement: sheetdata.Name,
            ),
            ContentsWidget(
              columnNum:SheetSettings.deliverColumn,
              kind: '直接or配送',
              dataElement: sheetdata.Deliver,
            ),
            ContentsWidget(
              columnNum:SheetSettings.booksNumberColumn,
              kind: '冊数',
              dataElement: sheetdata.BooksNumber,
            ),
            ContentsWidget(
              columnNum:SheetSettings.remarkColumn,
              kind: '連絡事項',
              dataElement: announce(),
            ),
            const SizedBox(
              height: 10,
            ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(
                height: 50,
                width:130,
                child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: const Color(SheetSettings.myThemeColor),
                    ),
                  onPressed: () {
                    showDialog<void>(
                    context: context,
                    builder: (_) {
                    return const ReturnWidget();
                    });
                    },
                  child: const Text('戻る',style: TextStyle(
                    color: Colors.white,
                  ),)
                    ),
              ),
              const SizedBox(
                width: 30,
              ),
                SizedBox(
                  height:50,
                width:130,
                child:
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(SheetSettings.myThemeColor),
                  ),
                  onPressed: () {
                    announce()!=""?
                    showDialog<void>(
                        context: context,
                        builder: (_) {
                          return ReceiveNGWidget(note:announce());
                        }):
                    sheetdata.Deliver!=SheetSettings.directString?
                    showDialog<void>(
                        context: context,
                        builder: (_) {
                          return DeliverWidget(sheetdata: sheetdata,);
                        }):
                    showDialog<void>(
                        context: context,
                        builder: (_) {
                          return PersonSelectWidget(sheetdata: sheetdata,);
                        });
                  },
                  child: const Text('受け取る',style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
                ),
              ]
            )
          ]
        ),
      ),
    );
  }
  announce(){
    if(int.tryParse(sheetdata.BooksNumber)==null){
      return "冊数異常";
    }else if(int.tryParse(sheetdata.BooksNumber)!<=0){
      return "冊数異常";
    }else if(sheetdata.ReceivePerson!=""){
      return "受取済の可能性";
    /*}else if(sheetdata.Cancel!=""){
      return "キャンセル済の可能性";*/
    }else if(sheetdata.Remark!=""){
      return sheetdata.Remark;
    }else{
      return "";
    }
  }
}
