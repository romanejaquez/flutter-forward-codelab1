import 'dart:async';
import 'package:flutter/material.dart';

class WelcomePageService extends ChangeNotifier {

  String name = 'Roman';
  String title1 = 'Flutter GDE';
  String title2 = 'Cloud Architect';

  Timer greetingsTimer = Timer(Duration.zero, () {});

  static List<String> greetings = [
    'Hello', 'Hola', 'Bonjour', 'Olá', 'Ciao', 'Namaste', 'Kon’nichiwa'
  ];

  int greetingsCounter = 0;

  String currentGreeting = greetings[0];

  late AnimationController wavingAnimation;


  void initializeAnimation(TickerProvider provider) {
    wavingAnimation = AnimationController(vsync: provider,
    duration: const Duration(milliseconds: 500)
    )..repeat(reverse: true);
  }

  void initializeGreetings() {

    greetingsTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (greetingsCounter == greetings.length) {
        greetingsCounter = 0;
      }

      currentGreeting = greetings[greetingsCounter];
      greetingsCounter++;

      notifyListeners();
    });
  }

  @override
  void dispose() {
    disposeTimer();
    disposeAnimation();
    super.dispose();
  }

  void disposeAnimation() {
    wavingAnimation.dispose();
  }

  void disposeTimer() {
    greetingsTimer.cancel();
  }
}