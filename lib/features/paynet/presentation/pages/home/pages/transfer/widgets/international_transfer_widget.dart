import 'package:flutter/material.dart';

class InternationalTransfer extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final String imagePath;
  final VoidCallback onTap;
  final double height;

  InternationalTransfer({super.key,
    required this.title,
    required this.backgroundColor,
    required this.imagePath,
    required this.onTap,
    this.height=156
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'PaynetB',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
