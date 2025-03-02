import 'dart:math';

import 'package:flutter/material.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox(
          height: screen.height,
          child: Image.asset(
            'images/blur.png',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey! Meet your flutter and web developer',
                style: TextStyle(
                  fontSize: max(min(36, (screen.width * 0.04)), 22),
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (screen.width >= 1035)
                Text(
                  'Darshan Paccha',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: max(150, (screen.width * 0.145)),
                        letterSpacing: -screen.width * 0.01,
                      ),
                ),
              if (screen.width < 1035)
                Text(
                  'Darshan\nPaccha',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        letterSpacing: screen.width < 450 ? -5 : -10,
                        fontSize: min(180, screen.width * 0.245),
                      ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
