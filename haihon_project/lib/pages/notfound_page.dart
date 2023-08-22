import 'package:flutter/material.dart';
import 'input_page.dart';
import '../settings/settings.dart';
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key,required this.input});
  final String input;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("照会結果",style: TextStyle(
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
                    Text(
                      "$inputは見つかりませんでした"
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 300, //横幅
                      height: 70, //高さ
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(SheetSettings.myThemeColor),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const InputPage()),
                          );
                        },
                        child: const Text('終了',style: TextStyle(
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