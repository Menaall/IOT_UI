import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateRecord extends StatefulWidget {
  const UpdateRecord({Key? key, required this.studentKey}) : super(key: key);

  final String studentKey;

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {
  final userNameController = TextEditingController();
  final userAgeController = TextEditingController();
  final userSalaryController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.reference().child('UsersData').child('CxE3MtExbaQHCfNRuBn4A53KiH83').child('readings');
    getStudentData();
  }

  void getStudentData() async {
    DataSnapshot snapshot = await dbRef.child(widget.studentKey).get();

    Map student = snapshot.value as Map;

    setState(() {
      userNameController.text = student['irsensor'];
      userAgeController.text = student['timestamp'];
    });
  }

  @override
  void dispose() {
    userNameController.dispose();
    userAgeController.dispose();
    userSalaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updating record',
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
                  'Updating data in Firebase Realtime Database',
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
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  decoration:  InputDecoration(
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
                  controller: userAgeController,
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
                  onPressed: () {
                    Map<String, dynamic> updatedData = {
                      'irsensor': userNameController.text,
                      'timestamp': userAgeController.text,
                    };

                    dbRef.child(widget.studentKey).update(updatedData).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Update Data',style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),),
                  color:Color(0xff19bda4),
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
