import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tranning/fetch.dart';
import 'package:tranning/insert.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Text('Tranning',
        style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w500,
      ),),
      centerTitle: true,
      backgroundColor: Color(0xff19bda4),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/training-programs.jpg',  // Replace with the actual path to your image file
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Firebase Realtime Database ',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InsertData()));
              },
              child: const Text('Insert Data',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),),
              color:Color(0xff19bda4),
              textColor: Colors.white,
              minWidth: 300,
              height: 60,
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FetchData()));
              },
              child: const Text('Show Data',style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),),
              color: Color(0xff19bda4),
              textColor: Colors.white,
              minWidth: 300,
              height: 60,
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}