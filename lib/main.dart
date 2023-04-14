import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool visText = false;
  bool jpText = false;

  void _inText(){
    setState(() {
      visText = true;
    });
  }

  void _visAllOn(){
    setState(() {
      visText = false;
      jpText = false;
    });
  }

  void _japanAdressChange(){
    setState(() {
      jpText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('チャットページ'),
      ),
      body: Container(
        //alignment: Alignment.center,
        child: Column(
          children: [
            Text('要件を選択'),
            ElevatedButton(onPressed: _inText, child: Text('住所変更について')),
            ElevatedButton(onPressed: (){}, child: Text('その他お問合せ')),
            Visibility(
              visible: visText,
                child: Column(
                  children: [
                    Text('住所変更ですね。どのような要件でしょうか'),
                    ElevatedButton(onPressed: _japanAdressChange, child: Text('国内での住所変更')),
                    ElevatedButton(onPressed: (){}, child: Text('海外への住所変更')),
                  ],
                )),
            Visibility(
                visible: jpText,
                child: Column(
                  children: [
                    Text('国内での住所変更ですね。どのような手続きにしましょうか'),
                    ElevatedButton(onPressed: (){}, child: Text('社内封筒で書類を送る')),
                    ElevatedButton(onPressed: (){}, child: Text('担当者へフォーム入力')),
                  ],
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _visAllOn,
        child: Icon(Icons.add),
      ),
    );
  }
}
