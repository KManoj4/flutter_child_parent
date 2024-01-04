import 'package:flutter/material.dart';
import 'package:flutter_child_parent/second_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var userName = '';
  var mobileNo = '';

  @override
  void initState() {
    print('User Name :${userName}');
    print('MobileNo :${mobileNo}');

    getAllData();
    super.initState();
  }

  getAllData() async {
    final preferences = await SharedPreferences.getInstance();
    userName = preferences.getString('username') ?? '';
    mobileNo = preferences.getString('mobileNo') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Shared Preference Child to Parent'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userName, style: TextStyle(fontSize: 20)),
            Text(
              mobileNo,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                },
                child: Text('Enter'))
          ],
        ),
      ),
    );
  }
}
