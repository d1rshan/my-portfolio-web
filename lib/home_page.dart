import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        // height: MediaQuery.sizeOf(context).height - 60,
        // width: 1200,
        child: ScrollTransformView(
          children: [
            ScrollTransformItem(
              offsetBuilder: (scrollOffset) {
                final offScreenPercentage =
                    min(scrollOffset / screen.height, 1);
                final heightShrinkageAmount =
                    screen.height * 0.1 * offScreenPercentage;

                final bool startedMovingImage =
                    scrollOffset >= screen.height * 1;
                final double onScreenOffset =
                    scrollOffset + heightShrinkageAmount / 2;

                return Offset(
                  0,
                  !startedMovingImage
                      ? onScreenOffset
                      : onScreenOffset - (scrollOffset - screen.height * 1),
                );
              },
              builder: (scrollOffset) {
                final offScreenPercentage =
                    min(scrollOffset / screen.height, 1);
                return SizedBox(
                  height: screen.height -
                      (screen.height * 0.1 * offScreenPercentage),
                  width:
                      screen.width - (screen.width * 0.2 * offScreenPercentage),
                  child: Image.asset(
                    'images/bg.png',
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
            ScrollTransformItem(
              offsetBuilder: (scrollOffset) {
                return Offset(0, -screen.height);
              },
              builder: (scrollOffset) {
                return SizedBox(
                  height: screen.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Howdy! Meet Your Flutter Web & App Developer.',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        'Darshan Paccha',
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 1200 * 0.145,
                                ),
                      ),
                    ],
                  ),
                );
              },
            ),
            ScrollTransformItem(
              builder: (scrollOffset) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: screen.height,
                      child: Image.asset(
                        'images/bg.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          'About',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 1200 * 0.145,
                              ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
