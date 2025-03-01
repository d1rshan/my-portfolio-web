import 'package:flutter/material.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: screen.height,
          child: Image.asset(
            'images/blur.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey! Meet Your Flutter Developer',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            Text(
              'Darshan Paccha',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: screen.width * 0.145,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
