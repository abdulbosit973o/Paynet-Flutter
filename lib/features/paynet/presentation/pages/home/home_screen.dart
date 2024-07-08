import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/widgets/home_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: HomeBottomNavigationBar( selectIndex: _selectedIndex,onItemTapped: (index ) {
        _selectedIndex = index;
        setState(() {});
      },),
      body: IndexedStack(
        children: [
          Container(color: Colors.green,),
          Container(color: Colors.red,),
          Container(color: Colors.blue,),
          Container(color: Colors.black,)
        ],
      ),

    );
  }
}
