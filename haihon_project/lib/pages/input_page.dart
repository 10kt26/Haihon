import 'package:flutter/material.dart';
import 'load_page.dart';
import '../settings/settings.dart';
class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  String _inputStr = "";
  final TextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("入力画面",style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:Column(
                children:[
                  TextFormField(
                    controller: TextController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color:Color(SheetSettings.myThemeColor))),
                      hintText: '申込番号or学生証番号',),
                    keyboardType: TextInputType.number,
                    onChanged:(text){
                      _inputStr=text;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300, //横幅
                    height: 70, //高さ
                    child:ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xf080DEEA),
                      ),
                      onPressed:(int.tryParse(_inputStr)??0)<=0?null: () {
                        TextController.clear();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoadPage(input: _inputStr,)),
                        );
                        },
                      child: const Text('検索',style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}