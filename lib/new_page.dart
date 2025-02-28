import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:portfolio/content.dart';

class NewPage extends StatelessWidget {
  NewPage({super.key});

  final double gap = 30;
  final double largeGap = 200;

  final List<String> skills = [
    'Python',
    'Dart',
    'Flutter',
    'C',
    'C++',
    'Firebase',
    'Riverpod',
    'Provider',
    'Bloc',
    'HTML',
    'CSS',
    'JavaScript',
    'React',
    'Java',
    'Appwrite',
    'Git',
    'Figma',
    'Supabase',
    'Hive',
    'Isar',
    'SQL'
  ];
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 1200,
          child: ListView(
            children: [
              Gap(gap),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: screen.height - 60,
                    child: Image.asset(
                      'images/bg.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Howdy! Meet Your Flutter Developer',
                        style: Theme.of(context).textTheme.displaySmall,
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
                ],
              ),
              Gap(gap),
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    // ABOUT SECTION

                    SizedBox(
                      height: screen.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'About',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(Content.about),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screen.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Skills',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Wrap(
                            children: List.generate(
                              skills.length,
                              (index) => MySkillCard(
                                text: skills[index],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // PROJECTS SECTION
                    SizedBox(
                      height: screen.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Projects',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(Content.about),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(gap),
            ],
          ),
        ),
      ),
    );
  }
}

class MySkillCard extends StatelessWidget {
  final String text;
  const MySkillCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/bg.png'),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Ensure text is readable
        ),
      ),
    );
  }
}
