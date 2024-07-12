import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/core/utils/colors/lingth_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'History App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HistoryPage(),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f1f6),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 60.0, // Height when fully expanded
              backgroundColor: const Color(0xfff0f1f6),
              elevation: 0,
              foregroundColor: const Color(0xfff0f1f6),
              flexibleSpace: Container(
                alignment: Alignment.centerLeft,
                child: const FlexibleSpaceBar(
                  title: Text(
                    'Tarix',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'PaynetB',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  titlePadding: EdgeInsets.only(left: 16.0), // Adjust padding as needed
                ),
              ),
              actions: [
                Icon(Icons.search, color: LightColors.colorGrey, size: 24,),
                SizedBox(width: 16,)
              ],
            )
            ,
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // Logic to change date to previous month
                                    },
                                    borderRadius: BorderRadius.circular(24),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.keyboard_arrow_left,
                                          size: 28),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      'Iyul 2024',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Logic to change date to next month
                                      print("Next month tapped");
                                    },
                                    borderRadius: BorderRadius.circular(24),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.keyboard_arrow_right,
                                          size: 28),
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      // Logic to apply filter
                                      print("Filter icon tapped");
                                    },
                                    borderRadius: BorderRadius.circular(24),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.filter_alt_sharp,
                                          color: Colors.black54),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      for (int i = 0; i < 20; i++)
                        Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Logic to change date to previous month
                                        print("Previous month tapped");
                                      },
                                      borderRadius: BorderRadius.circular(24),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.keyboard_arrow_left,
                                            size: 28),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        'Iyul 2024',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Logic to change date to next month
                                        print("Next month tapped");
                                      },
                                      borderRadius: BorderRadius.circular(24),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.keyboard_arrow_right,
                                            size: 28),
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        // Logic to apply filter
                                        print("Filter icon tapped");
                                      },
                                      borderRadius: BorderRadius.circular(24),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.filter_alt_sharp,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                // Add more widgets here if needed
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
