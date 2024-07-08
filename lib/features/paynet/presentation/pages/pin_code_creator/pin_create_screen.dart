import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../../core/utils/assets/app_image.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> with SingleTickerProviderStateMixin {
  List<int> pin = [];
  List<int> firstPin = [];
  bool isFirstAttempt = true;
  bool isError = false;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.1, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onNumberButtonPressed(int number) {
    if (pin.length < 4) {
      setState(() {
        pin.add(number);
      });
      if (pin.length == 4) {
        if (isFirstAttempt) {
          firstPin = List.from(pin);
          setState(() {
            isFirstAttempt = false;
            pin.clear();
          });
        } else {
          if (pin.toString() == firstPin.toString()) {
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            setState(() {
              isError = true;
            });
            _controller.forward();
            SchedulerBinding.instance.addPostFrameCallback((_) {
              setState(() {
                isError = false;
                pin.clear();
              });
            });
          }
        }
      }
    }
  }

  void _onDeleteButtonPressed() {
    if (pin.isNotEmpty) {
      setState(() {
        pin.removeLast();
      });
    }
  }

  Widget _buildNumberButton(int number) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => _onNumberButtonPressed(number),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          backgroundColor: Colors.white,
        ),
        child: Text(
          number.toString(),
          style: const TextStyle(fontFamily:'PaynetB',fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildTextButton(String text) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(fontFamily:'PaynetB',fontSize: 8, color: Colors.black),
      ),
    );
  }

  Widget _buildIconButton() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: IconButton(
        icon: const Icon(Icons.backspace, color: Colors.black),
        onPressed: _onDeleteButtonPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 56),
                Image.asset(
                  AppImage.logo,
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'PIN-kodni kiriting',
                  style: TextStyle(fontFamily:'PaynetB',fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Telefon raqamingiz\n+998 95 •••• 30',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily:'PaynetB',fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            Column(
              children: [
                SlideTransition(
                  position: _offsetAnimation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index < pin.length
                              ? (isError ? Colors.red : Colors.green)
                              : Colors.grey[300],
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      ...[1, 4, 7].map((i) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(3, (j) {
                            int number = i + j;
                            return _buildNumberButton(number);
                          }),
                        );
                      }).toList(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildTextButton('PIN-kodni\nunutding\nizmi?'),
                          _buildNumberButton(0),
                          _buildIconButton()
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
