import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/history/history_page.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/main/main_page.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/paynet/payment_page.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/transfer/transfer_page.dart';
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
      body:  IndexedStack(
        index:_selectedIndex,
        children: const [
          MainPage(),
          TransferPage(),
          PaymentPage(),
          HistoryPage()
        ],
      ),

    );
  }
}
