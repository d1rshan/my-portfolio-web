import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/themes/content.dart';
import 'package:portfolio/components/my_skill_card.dart';
import 'package:portfolio/themes/theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
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
            'My skills',
            style: sectionHeadingStyle(screen),
          ),
          Gap(5),
          Wrap(
            children: List.generate(
              Content.skills.length,
              (index) => MySkillCard(
                text: Content.skills[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
