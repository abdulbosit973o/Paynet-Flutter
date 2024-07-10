import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/colors/lingth_colors.dart';

class MyCardsWidget extends StatelessWidget {
  const MyCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(offset: Offset(0.001, 0.001), color: Colors.black12, blurRadius: 10, spreadRadius: 0.002),
      ], borderRadius: BorderRadius.circular(16), color: LightColors.white),
      child:Column(
        children: [

        ],
      ),
    );
  }
}
