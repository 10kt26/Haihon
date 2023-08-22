import 'package:flutter/material.dart';
import '../settings/settings.dart';
class ContentsWidget extends StatelessWidget {
  const ContentsWidget({
    super.key,
    required this.columnNum,
    required this.kind,
    required this.dataElement,
  });
  final int columnNum;
  final String kind;
  final String dataElement;
  cellColor(){
    if(columnNum==SheetSettings.deliverColumn&&dataElement!=SheetSettings.directString){//配送のとき反転
      return true;
    }else if(columnNum==SheetSettings.booksNumberColumn&&dataElement!="1") { //1冊以外だと反転
      return true;
    /*}else if(columnNum==SheetSettings.receivePersonColumn&&dataElement!=""){//受取済みだと反転
      return true;
    }else if(columnNum==SheetSettings.cancelColumn&&dataElement!=""){//キャンセル済みだと反転
      return true;*/
    }else if(columnNum==SheetSettings.remarkColumn&&dataElement!=""){//備考あり、受取済、冊数異常だと反転
      return true;
    }else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SizedBox(
              height: 50,
              width: 100,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Center(
                  child: Text(kind),
                ),
              ),
            ),
          ),
          cellColor()?Expanded(
            child: Container(
              color: Colors.red,
              height: 50,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Center(
                  child: Text(
                    dataElement,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ):Expanded(
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Center(
                  child: Text(
                    dataElement,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}