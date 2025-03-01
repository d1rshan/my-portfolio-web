import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/themes/content.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);

    return Container(
      padding: EdgeInsets.all(50),
      width: screen.width,
      height: screen.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'About me',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Gap(10),
          Text(
            Content.about,
          ),
        ],
      ),
    );
  }
}
