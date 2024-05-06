import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

_makingPhoneCall() async{
  const url = 'tel:4383087293';
  if(await launch(url)){
    await launch(url);
  } else{
    throw 'Could not call $url';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CAlling App'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 250.0,
                ),
                Text('Welcome to the contact page',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
                ),
                ElevatedButton(onPressed: _makingPhoneCall, child: Text('Call'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

