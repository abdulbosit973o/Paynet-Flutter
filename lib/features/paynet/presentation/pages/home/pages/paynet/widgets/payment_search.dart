import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../bloc/payment/payment_bloc.dart';

class PaymentSearch extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback cancelClick;

  const PaymentSearch({super.key, required this.onTap, required this.cancelClick});

  @override
  _PaymentSearchState createState() => _PaymentSearchState();
}

class _PaymentSearchState extends State<PaymentSearch> {
  final TextEditingController textSearchController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (!state.isShow) {
          textSearchController.clear();
          focusNode.unfocus();
        }
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white60,
          child: TextField(
            onTap: widget.onTap,
            focusNode: focusNode,
            onChanged: (text) {
              setState(() {
                textSearchController.text = text;
              });
            },
            controller: textSearchController,
            decoration: InputDecoration(
              fillColor: Colors.grey[300],
              filled: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 12,top: 14,bottom: 14),
                child: Image.asset(
                  "assets/icon/ic_search.png",
                  height: 18,
                  width: 18,
                  color: Colors.grey,
                ),
              ),
              suffixIcon: textSearchController.text.isNotEmpty
                  ? IconButton(
                icon: const Icon(Icons.cancel,color: Colors.grey,),
                onPressed: () {
                  widget.cancelClick();
                  setState(() {
                    textSearchController.clear();
                  });
                },
              )
                  : Container(width: 0),
              hintText: "Izlash",
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color:Colors.grey.shade100 )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color:Colors.grey.shade100 )),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color:Colors.grey.shade100 )),
            ),
          ),
        );
      },
    );
  }
}
