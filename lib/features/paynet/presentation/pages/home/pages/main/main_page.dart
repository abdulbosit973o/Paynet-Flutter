import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynet_app_flutter/features/paynet/bloc/page_main/page_main_bloc.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/add_card/add_card_screen.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/main/dialog/home_add_card_dialog.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/main/widgets/main_app_bar.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/main/widgets/my_cards_widget.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/main/widgets/my_money_widget.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/main/widgets/payment_card_widget.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/main/widgets/payment_offer_widget.dart';

import '../../../../../../../core/utils/status/card_status.dart';
import '../../../../../bloc/add_card/add_card_bloc.dart';
import '../../../../../data/model/card_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      backgroundColor: const Color(0xfff3f4f9),
      body: BlocConsumer<PageMainBloc, PageMainState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                MyMoneyWidget(money: 20000000, moneyIsHasEye: true, clickEye: () {}),
                const SizedBox(height: 12),
                PaymentCardWidget(
                    clickItem: () {},
                    clickWhatIsThis: () {},
                    clickFill: () {},
                    clickTransfer: () {},
                    clickToPay: () {},
                    paymentCartFour: "9999",
                    money: 111111,
                    moneyIsHasEye: true),
                const SizedBox(height: 12),
                PaymentOfferWidget(
                    clickItem: () {},
                    clickWhatIsThis: () {},
                    clickFill: () {},
                    clickTransfer: () {},
                    clickToPay: () {},
                    paymentCartFour: "9999",
                    money: 111111,
                    moneyIsHasEye: true),
                const SizedBox(height: 12),
                MyCardsWidget(
                  clickAddCard: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext ctx) {
                        return homeAddCardDialog(
                          clickRu: () {
                            Navigator.pop(context);
                          },
                          clickCancel: () {
                            Navigator.pop(context);
                          },
                          clickUz: () async {
                            Navigator.pop(context);

                            print('value push value MainPage');
                            final value = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                          create: (context) => AddCardBloc(),
                                          child: const AddCardScreen(),
                                        )));
                            print('print value before mounted: $value');

                            if (!context.mounted) return;

                            print('print value: $value');

                            if (value is bool && value == true) {
                              print("blockni chaqirdim 0");
                              context.read<PageMainBloc>().add(LoadMainScreenEvent());
                            }
                          },
                        );
                      },
                    );
                  },
                  cardList: state.cardList,/* [
                    CardModel("1234 2222 2222 3333", "12/12", CardStatus.humo, 123413, 4),
                  ],*/
                  moneyIsHasEye: true,
                  keshbekMoney: 0,
                  clickCard1: () {},
                  clickCard2: () {},
                  clickAllCard: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
