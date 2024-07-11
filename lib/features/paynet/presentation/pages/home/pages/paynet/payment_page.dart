import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/paynet/widgets/payment_item.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/paynet/widgets/payment_search.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/pages/paynet/widgets/top_texts.dart';

import '../../../../../../../core/utils/assets/app_image.dart';
import '../../../../../../../core/utils/colors/lingth_colors.dart';
import '../../../../../../../core/utils/component/text_my_font.dart';
import '../../../../../../../core/utils/gradent/card_gradient.dart';
import '../../../../../bloc/payment/payment_bloc.dart';
import '../main/widgets/home_common_widget.dart';
import '../transfer/widgets/common_widget.dart';
import '../transfer/widgets/international_transfer_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isShow = true;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: 2,
        backgroundColor: Colors.transparent,
      ),
      body: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopTexts(
                    onTap: () {
                      context.read<PaymentBloc>().add(PaymentSearchFocusEvent(isShow: false));
                    },
                    isShow: state.isShow,
                  ),
                  const SizedBox(height: 8),
                  PaymentSearch(
                    onTap: () {
                      context.read<PaymentBloc>().add(PaymentSearchFocusEvent(isShow: true));
                    },
                    cancelClick: () {
                      context.read<PaymentBloc>().add(PaymentSearchFocusEvent(isShow: false));
                    },
                  ),
                  if (state.isShow) _focusedState() else _noFocusState(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _focusedState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child:TextMyFont.textBold(text: "Ommaboplari", size: 18, color: LightColors.black),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(offset: Offset(0.0001, 0.0001), color: Colors.black12, blurRadius: 4, spreadRadius: 0.002),
                    ],
                    color: Colors.white),
                child: PaymentItem(),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
              );
            },
          )
        ],
      ),
    );
  }

  Widget _noFocusState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Text(
            'Shablonlar',
            style: TextStyle(
              fontFamily: 'PaynetB',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: LightColors.inputContainerColor, shape: BoxShape.circle),
            child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(color: LightColors.colorGrey, shape: BoxShape.circle),
                child: Icon(
                  Icons.add,
                  color: LightColors.white,
                )),
          ),
          const SizedBox(height: 4),
          const Text(
            'Qo’shish',
            style: TextStyle(fontFamily: 'Paynet', fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomCard(
                  title: "Paynet QilvoR",
                  subtitle: '',
                  backgroundColor: const Color(0xffeceff4),
                  imagePath: AppImage.toRussia,
                  // Replace with your image path
                  onTap: () {
                    print("O'zimning kartamga tapped");
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomCard(
                  title: "Tezkor to'lovlar",
                  subtitle: '',
                  backgroundColor: const Color(0xfff1ecfd),
                  imagePath: AppImage.toRussia,
                  // Replace with your image path
                  onTap: () {
                    print('Paynet-kartamga tapped');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CommonCard(
            title: "Poyezd Chiptasi",
            subtitle: "qulay va tez",
            buttonText: "Sotib olish",
            backgroundGradient: const LinearGradient(
              colors: [Color(0xffdef9e6), Color(0xffddf8e5)],
            ),
            onContainerTap: () {
              print('Container tapped');
            },
            imagePath: AppImage.railway,
            onButtonTap: () {
              print('Button tapped');
            },
          ),
          const SizedBox(height: 12),
          CommonCard(
            title: 'Qarzdorlikni bilib oling',
            subtitle: 'Foydali va ichonli',
            buttonText: 'Chipta sotib olish',
            backgroundGradient: const LinearGradient(
              colors: [Color(0xFFeaf4fe), Color(0xFFeaf4fe)],
            ),
            onContainerTap: () {
              print('Container tapped');
            },
            imagePath: AppImage.avia,
            onButtonTap: () {
              print('Button tapped');
            },
          ),
          const SizedBox(height: 12),
          const Text(
            'To\'lov turlari',
            style: TextStyle(
              fontFamily: 'PaynetB',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  children: [
                    InternationalTransfer(
                      title: 'Aloqa',
                      backgroundColor: const Color(0xffffefb9),
                      imagePath: AppImage.toUzbekistan,
                      // Replace with your image path
                      onTap: () {
                        print('O\'zbekistonga tapped');
                      },
                    ),
                    const SizedBox(height: 8,),
                    InternationalTransfer(
                      height: 132,
                      title: 'Internet va TV',
                      backgroundColor: const Color(0xffd3f3fe),
                      imagePath: AppImage.internetWifi,
                      // Replace with your image path
                      onTap: () {
                        print('O\'zbekistonga tapped');
                      },
                    ),
                    const SizedBox(height: 8,),
                    InternationalTransfer(
                      height: 132,
                      title: "Ta'lim",
                      backgroundColor: const Color(0xffffe6df),
                      imagePath: AppImage.internetWifi,
                      // Replace with your image path
                      onTap: () {
                        print('O\'zbekistonga tapped');
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      height: 72,
                      decoration: BoxDecoration(color: const Color(0xffeef1f6), borderRadius: BorderRadius.circular(16)),
                      width: double.maxFinite,
                      child: const Text(
                        "Rekvizit \nbo'yicha to'lov",
                        style: TextStyle(fontFamily: "PaynetB", fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InternationalTransfer(
                      title: 'Komunal \n to\'lovlar',
                      backgroundColor: const Color(0xffdafaed),
                      imagePath: AppImage.toUzbekistan,
                      // Replace with your image path
                      onTap: () {
                        print('O\'zbekistonga tapped');
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InternationalTransfer(
                      height: 190,
                      title: 'Davlat ximatlari va shtraflar',
                      backgroundColor: const Color(0xfff1e7ff),
                      imagePath: AppImage.toUzbekistan,
                      // Replace with your image path
                      onTap: () {
                        print('O\'zbekistonga tapped');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),



            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: CustomCard(
                  title: "Mudatli to'lovlar",
                  subtitle: '',
                  backgroundColor: const  Color(0xffeef1f6),
                  imagePath: AppImage.toRussia,
                  // Replace with your image path
                  onTap: () {
                    print("O'zimning kartamga tapped");
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomCard(
                  title: "Transport va taksi",
                  subtitle: '',
                  backgroundColor: const  Color(0xffeef1f6),
                  imagePath: AppImage.toRussia,
                  // Replace with your image path
                  onTap: () {
                    print('Paynet-kartamga tapped');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: CustomCard(
                  title: "Kredit to'lovlar",
                  subtitle: '',
                  backgroundColor: const  Color(0xffeef1f6),
                  imagePath: AppImage.toRussia,
                  // Replace with your image path
                  onTap: () {
                    print("O'zimning kartamga tapped");
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomCard(
                  title: "Tibbiyot",
                  subtitle: '',
                  backgroundColor: const  Color(0xffeef1f6),
                  imagePath: AppImage.toRussia,
                  // Replace with your image path
                  onTap: () {
                    print('Paynet-kartamga tapped');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: CustomCard(
                  title: "Mikrokredit,lombardlar",
                  subtitle: '',
                  backgroundColor: const  Color(0xffeef1f6),
                  imagePath: AppImage.toRussia,
                  // Replace with your image path
                  onTap: () {
                    print("O'zimning kartamga tapped");
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomCard(
                  title: "Boshqa to'lovlar",
                  subtitle: '',
                  backgroundColor: const  Color(0xffeef1f6),
                  imagePath: AppImage.toRussia,
                  // Replace with your image path
                  onTap: () {
                    print('Paynet-kartamga tapped');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),



        ],
      ),
    );
  }
}
