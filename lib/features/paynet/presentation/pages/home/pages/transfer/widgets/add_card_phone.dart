import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCardPhone extends StatelessWidget {
  const AddCardPhone({super.key});

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 56,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Karta yoki telefon",
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: ""
            ),
            fillColor: Colors.white60,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
              )),
        ),
      ),
    );
  }
}
