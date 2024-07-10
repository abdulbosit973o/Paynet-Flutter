import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final Gradient backgroundGradient;
  final String imagePath;
  final VoidCallback onContainerTap;
  final VoidCallback onButtonTap;

  CommonCard({super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.backgroundGradient,
    required this.imagePath,
    required this.onContainerTap,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onContainerTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontFamily: 'PaynetM',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                        child: Text(
                          buttonText,
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'PaynetB',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

