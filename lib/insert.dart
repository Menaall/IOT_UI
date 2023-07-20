import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final irSensorController = TextEditingController();
  final timestampController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.reference().child('UsersData').child('CxE3MtExbaQHCfNRuBn4A53KiH83').child('readings');
  }

  @override
  void dispose() {
    irSensorController.dispose();
    timestampController.dispose();
    super.dispose();
  }

  void insertData() {
    String irSensor = irSensorController.text;
    String timestamp = timestampController.text;

    Map<String, dynamic> data = {
      'irsensor': irSensor,
      'timestamp': timestamp,
    };

    dbRef.push().set(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserting data',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),),
        centerTitle: true,
        backgroundColor: Color(0xff19bda4),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Inserting data in Firebase Realtime Database',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: irSensorController,
                  keyboardType: TextInputType.text,
                  decoration:  InputDecoration(
                    /*border: OutlineInputBorder(),*/
                    labelText: 'IR Sensor',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xff19bda4),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xff19bda4),
                        width: 2,
                      ),
                    ),
                    hintText: 'Enter IR Sensor Value',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: timestampController,
                  keyboardType: TextInputType.number,
                  decoration:  InputDecoration(
                    labelText: 'Timestamp',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xff19bda4),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xff19bda4),
                        width: 2,
                      ),
                    ),
                    hintText: 'Enter Timestamp',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: insertData,
                  child: const Text('Insert Data',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),),
                  color: Color(0xff19bda4),
                  textColor: Colors.white,
                  minWidth: 300,
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
