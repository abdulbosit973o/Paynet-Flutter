import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynet_app_flutter/core/utils/colors/lingth_colors.dart';
import 'package:paynet_app_flutter/core/utils/component/text_my_font.dart';
import 'package:paynet_app_flutter/core/utils/status/Status.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/add_card/widget/bottom_button.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/all_card/widget/card_item.dart';

import '../../../bloc/add_card/add_card_bloc.dart';
import '../../../bloc/all_card/all_card_bloc.dart';
import '../add_card/add_card_screen.dart';
import '../home/pages/main/dialog/home_add_card_dialog.dart';

class AllCardScreen extends StatelessWidget {
  const AllCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return true;
      },
      child: Scaffold(
        backgroundColor: LightColors.mainBackgroundColor,
        appBar: AppBar(
          backgroundColor: LightColors.mainBackgroundColor,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: Icon(Icons.arrow_back, color: LightColors.colorGrey)),
          title: TextMyFont.textBold(text: "Kartalarim", size: 24, color: LightColors.black),
        ),
        body: BlocConsumer<AllCardBloc, AllCardState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == Status.fail) {
              return Center(
                child: Text(state.errorMessage!),
              );
            } else {
              var cardList = state.cardList ?? [];
              return Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: cardList.length,
                          itemBuilder: (context, index) {
                            return CardItem(cardData: cardList[index], clickCard: () {});
                          })),
                  BottomButton(
                      clickButton: () {
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

                                final value = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                              create: (context) => AddCardBloc(),
                                              child: const AddCardScreen(),
                                            )));
                                if (!context.mounted) return;
                                if (value is bool && value == true) {
                                  context.read<AllCardBloc>().add(LoadAllCardEvent());
                                }
                              },
                            );
                          },
                        );
                      },
                      buttonVisible: true,
                      buttonText: "Karta qo'shish")
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
