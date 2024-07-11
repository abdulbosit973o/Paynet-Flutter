import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/core/utils/assets/app_image.dart';

import '../../../../../../../../core/utils/colors/lingth_colors.dart';
import '../../../../../../../../core/utils/component/text_my_font.dart';
class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextMyFont.textBold(text: "Suyiltirilgan GAZ", size: 16, color: LightColors.black),
      subtitle: TextMyFont.textNormal(text: '"HUDUDGAZTA\'MINOT" AJ', size: 14, color: LightColors.colorGrey),
      leading:  ClipOval(child: Image.asset(AppImage.pasImage,height: 42,width: 42,)),
      trailing:Container(
        height: 30,
        width: 52,
        decoration: BoxDecoration(
          color:const  Color(0xffddf8e5),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(child: TextMyFont.textBold(text: "0.2%", size: 14, color: Colors.black)),
      ),
    );
  }
}
