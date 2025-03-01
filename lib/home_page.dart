import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/content.dart';
import 'package:portfolio/riverpod.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // GlobalKeys to identify each section
  final GlobalKey section1Key = GlobalKey();
  final GlobalKey section2Key = GlobalKey();
  final GlobalKey section3Key = GlobalKey();
  final GlobalKey section4Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                IntroSection(screen: screen),

                // About Section
                Gap(300),
                Container(
                  padding: EdgeInsets.all(50),
                  width: screen.width,
                  height: screen.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'About',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Gap(10),
                      Text(
                        Content.about,
                      ),
                    ],
                  ),
                ),

                // SKILLS
                Container(
                  padding: EdgeInsets.all(30),
                  height: screen.height,
                  width: screen.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Skills',
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
                ),
              ],
            ),
          ),

          // TOP NAV BAR
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Center(
              child: MyNavBar(),
            ),
          ),
        ],
      ),
    );
  }
}

class IntroSection extends StatelessWidget {
  const IntroSection({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
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
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              'Darshan Paccha',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ],
    );
  }
}

class MyNavBar extends StatelessWidget {
  MyNavBar({super.key});

  final List<String> navBarItems = [
    'Hey',
    'About',
    'Skills',
    'Work',
    'Contact'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          navBarItems.length,
          (index) => MyNavBarItem(item: navBarItems[index], index: index),
        ),
      ),
    );
  }
}

class MyNavBarItem extends ConsumerStatefulWidget {
  final String item;
  final int index;
  const MyNavBarItem({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  ConsumerState<MyNavBarItem> createState() => _MyNavBarItemState();
}

class _MyNavBarItemState extends ConsumerState<MyNavBarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(
          horizontal: selectedIndex == widget.index ? 15 : 8, vertical: 4),
      decoration: (selectedIndex == widget.index)
          ? BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25),
            )
          : null,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => isHovered = true),
        onExit: (event) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: () {
            ref.read(selectedIndexProvider.notifier).state = widget.index;
          },
          child: Text(
            widget.item,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: (isHovered || (selectedIndex == widget.index))
                      ? Colors.white
                      : Colors.grey.shade500,
                ),
          ),
        ),
      ),
    );
  }
}

class MySkillCard extends StatefulWidget {
  final String text;
  const MySkillCard({
    super.key,
    required this.text,
  });

  @override
  State<MySkillCard> createState() => _MySkillCardState();
}

class _MySkillCardState extends State<MySkillCard> {
  bool isHovered = false;

  double _angle = 0.0;

  void _rotateContainer() {
    setState(() {
      _angle -= pi / 25; // Rotate 45 degrees on each tap
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        _rotateContainer();
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        _angle = 0;
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.all(5),
        duration: Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        transform: Matrix4.rotationZ(_angle),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 24,
            color: isHovered ? Colors.white : Colors.grey.shade600,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
