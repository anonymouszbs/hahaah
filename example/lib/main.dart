import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_aes_ecb_pkcs5/flutter_aes_ecb_pkcs5.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    print("世界你好");
    String code = "%2Ftemplate%2Fmobile%2Frainbow%2Fstatic%2Fimages%2Ficon_03.png";


    String platformVersion;

    int count = 0;
    for(int i=0;i<100;i++){

      var data = "{\"username\":\"helloword\"}";

      //生成16字节的随机密钥
      var key = await FlutterAesEcbPkcs5.generateDesKey(128);

      print(key);
      //加密
      var encryptText = await FlutterAesEcbPkcs5.encryptString(data, key);

      print(encryptText);
      //解密
      //var decryptText  = await FlutterAesEcbPkcs5.decryptString(encryptText, key,iv);

     /* print(decryptText);

      if(decryptText == data){
        count ++;
      }*/

    }
    platformVersion = count.toString()+"\n";
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
