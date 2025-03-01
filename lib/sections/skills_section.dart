import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/themes/content.dart';
import 'package:portfolio/components/my_skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);

    return Container(
      padding: EdgeInsets.all(50),
      height: screen.height,
      width: screen.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'My Skills',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Gap(10),
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
