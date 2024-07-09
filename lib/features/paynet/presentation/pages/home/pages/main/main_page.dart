import 'package:flutter/material.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/main/widgets/main_app_bar.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/main/widgets/my_money_widget.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/main/widgets/payment_card_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      backgroundColor: const Color(0xfff3f4f9),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyMoneyWidget(money: 20000000, moneyIsHasEye: true, clickEye: () {}),
            const SizedBox(height: 12),
            PaymentCardWidget(clickItem: () {},
                clickWhatIsThis: () {},
                clickFill: () {},
                clickTransfer: () {},
                clickToPay: () {},
                paymentCartFour: "9999",
                money: 111111,
                moneyIsHasEye: true),
          ],
        ),
      ),
    );
  }
}
