import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/pages/home/home_screen.dart';
import 'package:paynet_app_flutter/features/paynet/presentation/widgets/custom_navigation.dart';
import '../../../../../core/utils/assets/app_image.dart';
import '../../../bloc/pin/pin_bloc.dart';
import '../../../bloc/pin/pin_event.dart';
import '../../../bloc/pin/pin_state.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PinBloc(),
      child: PinView(),
    );
  }
}

class PinView extends StatefulWidget {
  @override
  _PinViewState createState() => _PinViewState();
}

class _PinViewState extends State<PinView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    context.read<PinBloc>().add(GetUserPassword());
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

  Widget _buildNumberButton(int number) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => context.read<PinBloc>().add(NumberButtonPressedPin(number)),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          backgroundColor: Colors.white,
        ),
        child: Text(
          number.toString(),
          style: const TextStyle(fontFamily:'PaynetB', fontSize: 24, color: Colors.black),
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
        style: const TextStyle(fontFamily:'PaynetB', fontSize: 8, color: Colors.black),
      ),
    );
  }

  Widget _buildIconButton() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: IconButton(
        icon: const Icon(Icons.backspace, color: Colors.black),
        onPressed: () => context.read<PinBloc>().add(DeleteButtonPressed()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocListener<PinBloc, PinState>(
          listener: (context, state) {
            if (state is PinError) {
              _controller.forward();
              SchedulerBinding.instance.addPostFrameCallback((_) {
                context.read<PinBloc>().add(ResetPin());
              });
            } else if (state is PinMatch) {
              context.read<PinBloc>().add(NavigateNext());
            }
            else if(state is PinSuccess) {
              CustomNavigation.push(context, const HomeScreen());
            }
          },
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
                    style: TextStyle(fontFamily:'PaynetB', fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Telefon raqamingiz\n+998 95 •••• 30',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily:'PaynetB', fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              Column(
                children: [
                  SlideTransition(
                    position: _offsetAnimation,
                    child: BlocBuilder<PinBloc, PinState>(
                      builder: (context, state) {
                        if (state is PinInput) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index < state.pin.length
                                      ? (state.isError ? Colors.red : Colors.green)
                                      : Colors.grey[300],
                                ),
                              );
                            }),
                          );
                        }
                        return Container();
                      },
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
      ),
    );
  }
}
