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
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications_rounded)),
            IconButton(onPressed: (){}, icon: Icon(Icons.share)),
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
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
          padding: EdgeInsets.fromLTRB(19, 35, 21, 0), 
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('DAY 8', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, letterSpacing: 0.15),),
                  SizedBox(height: 23,),
                  Card.outlined(
                    color: Colors.white,
                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)), side: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.12), width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 16, 3, 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Boilerplate 4', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromRGBO(0, 0, 0, 0.87), letterSpacing: 0.15,),),
                          Padding(
                            padding: EdgeInsetsGeometry.fromLTRB(1, 20, 25, 19),
                            child: Text('어느덧 SODA 캠프 8일차가 되었네요! \n여기까지 달려오시느라 수고 많으셨어요 :)\n\n아래 있는 CANCEL과 SUBMIT은 버튼입니다 !!', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(0, 0, 0, 0.6), letterSpacing: 0.25,)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton1(btnText: 'CANCEL',),
                              TextButton1(btnText: 'SUBMIT',),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ChoiceChip1(),
                    ]
                  ),
                ],
              ),
          )
        ),
        floatingActionButton: FAB1(),
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
      child: Tooltip(
        message: 'Tooltip',
        showDuration: Duration(seconds: 3),
        preferBelow: false,
        child: FloatingActionButton(
          backgroundColor: Color.fromRGBO(24, 41, 73, 1),
          onPressed: () {},
          shape: CircleBorder(),
          child: Icon(Icons.add, size: 24, color: Colors.white,),
        )
      )
    );
  }
}

class TextButton1 extends StatefulWidget {
  const TextButton1({super.key, required this.btnText});

  final String btnText;

  @override
  State<TextButton1> createState() => _TextButton1State();
}

class _TextButton1State extends State<TextButton1> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){}, 
      child: Padding(
        padding: EdgeInsets.fromLTRB(6, 10, 8, 10),
        child: Text(widget.btnText, style: TextStyle(fontSize: 14, color: Color.fromRGBO(75, 110, 177, 1), fontWeight: FontWeight.w500, letterSpacing: 1.25),),
      )
    );
  }
}

class ChoiceChip1 extends StatefulWidget {
  const ChoiceChip1({super.key});

  @override
  State<ChoiceChip1> createState() => _ChoiceChip1State();
}

class _ChoiceChip1State extends State<ChoiceChip1> {
  bool isSelected = false; 
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    List<String> chips = ['SODA', 'CAMP', 'FUN', 'FLUTTER'];

    return Theme(
      data: ThemeData(
        useMaterial3: false
      ),
      child: Row(
        children: List<Widget>.generate(chips.length, (int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ChoiceChip(
              selectedColor: const Color.fromRGBO(24, 41, 73, 1),
              disabledColor: const Color.fromRGBO(33, 33, 33, 0.08),
              label: Text(
                chips[index],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _value == index ? Colors.white : const Color.fromRGBO(0, 0, 0, 0.87),
                  letterSpacing: 0.25,
                ),
              ),
              selected: _value == index,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? index : null;
                });
              },
            ),
          );
        }),
      )
    );
  }
}