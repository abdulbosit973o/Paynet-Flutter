import 'package:flutter/material.dart';
class HomeBottomNavigationBar extends StatelessWidget {
  final int selectIndex;
  final Function(int) onItemTapped;
  const HomeBottomNavigationBar({super.key, required this.onItemTapped,required this.selectIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      currentIndex: selectIndex,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.transfer_within_a_station),
          label: "Transfer",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: "Wallet",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timelapse_sharp),
          label: "Timelapse",
        ),
      ],
    );
  }
}
