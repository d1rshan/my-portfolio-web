import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/sections/about_section.dart';
import 'package:portfolio/sections/intro_section.dart';
import 'package:portfolio/sections/skills_section.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({super.key});

  final double largeGap = 200;
  final double mediumGap = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                IntroSection(),
                Gap(200),
                AboutSection(),
                Gap(mediumGap),
                SkillsSection(),
                Gap(mediumGap),
              ],
            ),
          ),

          // TOP NAV BAR
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(child: Container()),
          ),
        ],
      ),
    );
  }
}
