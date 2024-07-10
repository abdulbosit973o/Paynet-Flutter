import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Home Widget Example'),
        ),
        body: Center(
          child: MyHomeWidget(
            addHome: () {
              print('Home Added');
            },
            clickMyHome: () {
              print('My Home Clicked');
            },
            addColculation: () {
              print('Calculation Added');
            },
          ),
        ),
      ),
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  final VoidCallback addHome;
  final VoidCallback clickMyHome;
  final VoidCallback addColculation;

  const MyHomeWidget(
      {super.key,
        required this.addHome,
        required this.clickMyHome,
        required this.addColculation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: GestureDetector(
          onTap: addHome,
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Mening uylarim',
                        style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'PaynetM')),
                    Spacer(),
                    Icon(Icons.add_circle, color: Color.fromRGBO(33, 154, 63, 100),)
                  ],
                ),

                Card(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
