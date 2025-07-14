import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(24, 41, 72, 1),
          centerTitle: false,
          title: const Text('SODA', style: TextStyle(fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w500),), 
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            Padding(
              padding: EdgeInsets.all(0),
              child: Switch1(),
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(color: Color.fromRGBO(24, 41, 72, 1)),
                child: Text(
                  'SODA', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500), 
                ),
              ),
              ListTile(
                leading: const Icon(Icons.favorite, color: Color.fromRGBO(0, 0, 0, 0.6),),
                title: const Text('Icon : favorite', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6), fontWeight: FontWeight.w500),),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20), 
            child: Expanded(
              child: Column(
                children: [
                  TextField1(),
                  SizedBox(height: 40),
                  RadioButton1(),
                  CheckButton1(),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('버튼을 눌러 날짜를 선택해주세요.', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500, letterSpacing: 1.25),),
                      DatePicker1()
                    ],
                  ),
                ]
              ),
          )
        ),
        floatingActionButton: const FAB1(),
        
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(height: 1, thickness: 2, color: Colors.black, indent: 13, endIndent: 14,),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Copyright 2022 SODA All rights reserved.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
 
      ),
    );
  }
}


class FAB1 extends StatefulWidget {
  const FAB1({super.key});

  @override
  State<FAB1> createState() => _FAB1State();
}

class _FAB1State extends State<FAB1> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(24, 41, 73, 1),
        onPressed:
          () => showDialog<String>(
            context: context,
            builder:
              (BuildContext context) => Dialog(
                backgroundColor: Colors.white,
                shape: BoxBorder.fromBorderSide(BorderSide.none),
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 16, 13),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('+ 버튼을 누르셨습니다.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromRGBO(0, 0, 0, 0.6), letterSpacing: 0.25),),
                      SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('확인', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color.fromRGBO(24, 41, 73, 1), letterSpacing: 1.25,), ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 24, color: Colors.white,),
      ),
    );
  }
}

class Switch1 extends StatefulWidget {
  const Switch1({super.key});

  @override
  State<Switch1> createState() => _Switch1State();
}

class _Switch1State extends State<Switch1> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: false
      ),
      child: Switch(
        padding: EdgeInsets.only(right: 19),
        activeTrackColor: Color.fromRGBO(75, 110, 177, 1),
        value: isOn,
        onChanged: (value) {
          setState(() {
            isOn = value;
          });
          if (value) {
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              content: Text('switch를 ON 하였습니다.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14, letterSpacing: 0.25),),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {},
                backgroundColor: Color.fromRGBO(57, 57, 57, 1),
                textColor: Color.fromRGBO(249, 153, 153, 1),
              ),
            ),
          );
          }
        },
        activeColor: Colors.white,
        inactiveTrackColor: Colors.grey,
      )
    );
  }
}

class TextField1 extends StatefulWidget {
  const TextField1({super.key});

  @override
  State<TextField1> createState() => _TextField1State();
}

class _TextField1State extends State<TextField1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14, bottom: 14), 
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Name',
          filled: true,
          fillColor: Color.fromRGBO(33, 33, 33, 0.08),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
            borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
            borderSide: BorderSide(color: Color.fromRGBO(24, 41, 73, 1), strokeAlign: BorderSide.strokeAlignCenter, width: 2)
          ),
        ),
      ),
    );
  }
}

class RadioButton1 extends StatefulWidget {
  const RadioButton1({super.key});

  @override
  State<RadioButton1> createState() => _RadioButton1State();
}

class _RadioButton1State extends State<RadioButton1> {
  String? gender = 'male';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: 'male',
          groupValue: gender,
          activeColor: Color.fromRGBO(75, 110, 177, 1),
          onChanged: (value) {
            setState(() {
              gender = value;
            });
          },
        ),
        Text('Male', style: TextStyle(fontSize: 14, letterSpacing: 1.99, fontWeight: FontWeight.w500, color: Colors.black),),
        SizedBox(width: 50),
        Radio<String>(
          value: 'female',
          groupValue: gender,
          activeColor: Color.fromRGBO(75, 110, 177, 1),
          onChanged: (value) {
            setState(() {
              gender = value;
            });
          },
        ),
        Text('Female', style: TextStyle(fontSize: 14, letterSpacing: 1.99, fontWeight: FontWeight.w500, color: Colors.black),),
      ],
    );
  }
}

class CheckButton1 extends StatefulWidget {
  const CheckButton1({super.key});

  @override
  State<CheckButton1> createState() => _CheckButton1State();
}

class _CheckButton1State extends State<CheckButton1> {
  bool designer = false;
  bool developer = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: designer,
          activeColor: Color.fromRGBO(75, 110, 177, 1),
          onChanged: (bool? value) {
            setState(() {
              designer = value ?? false;
            });
          },
        ),
        Text('Designer', style: TextStyle(fontSize: 14, letterSpacing: 1.99, fontWeight: FontWeight.w500, color: Colors.black),),
        SizedBox(width: 15),
        Checkbox(
          value: developer,
          activeColor: Color.fromRGBO(75, 110, 177, 1),
          onChanged: (bool? value) {
            setState(() {
              developer = value ?? false;
            });
          },
        ),
        Text('Developer', style: TextStyle(fontSize: 14, letterSpacing: 1.99, fontWeight: FontWeight.w500, color: Colors.black),),
      ],
    );
  }
}

class DatePicker1 extends StatefulWidget {
  const DatePicker1({super.key});

  @override
  State<DatePicker1> createState() => _DatePicker1State();
}

class _DatePicker1State extends State<DatePicker1> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime(2030),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(4))), 
          side: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.12), strokeAlign: 1,),
          padding: EdgeInsets.fromLTRB(6, 4, 8, 4), 
        ),
        onPressed: _selectDate, 
        child: Text('SELECT DATE', style: TextStyle(fontSize: 14, color: Color.fromRGBO(75, 110, 177, 1), fontWeight: FontWeight.w500, letterSpacing: 1.25),),
      ),
    );
  }
}