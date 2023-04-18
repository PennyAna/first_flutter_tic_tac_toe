import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tapped = 0;
  final String title = "GATB TicTacToe";
  List<String> displayElement = [ '','','','',
                                 '','','','',
                                 '','','','',
                                 '','','','', ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(title: Text(title), backgroundColor: const Color(0XFF7CB134), elevation: 6.0),
      backgroundColor: const Color(0XFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.purple[900],
              width: 500,
              height: 500,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 16,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          _tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0XFF0FB4C3))
                          ),
                          child: Center(
                            child: Text(
                              displayElement[index],
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 35),
                            ),
                          ),
                        )
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (displayElement[index] == '') {
        displayElement[index] = 'X';
      } else if (displayElement[index] == 'X') {
        displayElement[index] = 'O';
      } else if (displayElement[index] == 'O') {
        displayElement[index] = '';
      }
    });
  }
}
