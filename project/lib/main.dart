import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'notification.dart';
import 'package:timezone/timezone.dart' as tz;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController notificationTitle = TextEditingController();
  TextEditingController notificationDescription = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: notificationTitle,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Title'
                  ),
                ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: notificationDescription,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Description'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: GestureDetector(
                onTap: (){
                  NotificationService().showNotification(1, notificationTitle.text, notificationDescription.text);
                },
                child: Container(
                  height: 40,
                  width: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text('notify me',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
