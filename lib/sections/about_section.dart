import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/themes/content.dart';
import 'package:portfolio/themes/theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: screen.width >= 800 ? 100 : 20),
      width: screen.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'About me',
            style: sectionHeadingStyle(screen),
          ),
          Gap(10),
          Text(Content.about),
        ],
      ),
    );
  }
}
