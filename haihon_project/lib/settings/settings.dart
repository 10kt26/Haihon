import 'dart:ui';

class SheetSettings {
  static const credentials = r'''{
    
  }''';
  static const spreadsheetId = '';
  static const sheetname = '';

  //A列が1,B列が2・・・
  //申込番号の列
  static const referenceNumberColumn=1;
  //学生番号の列
  static const studentNumberColumn=2;
  //名前の列
  static const nameColumn=3;
  //配達かの列
  static const deliverColumn=4;
  //受取人の列
  static const receivePersonColumn=5;
  //冊数の列
  static const booksNumberColumn=6;
  //備考の列
  static const remarkColumn=7;
  //受取日時の列
  static const timeColumn=29;
  //表記揺れ対策
  static const directString="直接引換";

  static const myThemeColor=0xf080DEEA;
}