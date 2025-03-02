import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/components/my_nav_bar.dart';
import 'package:portfolio/riverpod.dart';
import 'package:portfolio/sections/about_section.dart';
import 'package:portfolio/sections/contact_section.dart';
import 'package:portfolio/sections/intro_section.dart';
import 'package:portfolio/sections/skills_section.dart';
import 'package:portfolio/sections/work_section.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys to identify each section
  final List<GlobalKey> sectionKeys = [
    GlobalKey(), // Intro section
    GlobalKey(), // About
    GlobalKey(), // Skills
    GlobalKey(), // Work
    GlobalKey(), // Contact Me
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    for (int i = 0; i < sectionKeys.length; i++) {
      final RenderBox? box =
          sectionKeys[i].currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        final position = box.localToGlobal(Offset.zero).dy;
        if (position <= 200 && position >= -box.size.height / 2) {
          ref.read(selectedIndexProvider.notifier).state = i;
          break;
        }
      }
    }
  }

  void _scrollToSection(int index) {
    final RenderBox box =
        sectionKeys[index].currentContext!.findRenderObject() as RenderBox;
    final position =
        box.localToGlobal(Offset.zero).dy + _scrollController.offset;

    _scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                IntroSection(key: sectionKeys[0]),
                Gap(200),
                AboutSection(),
                SkillsSection(key: sectionKeys[2]),
                WorkSection(key: sectionKeys[3]),
                ContactSection(key: sectionKeys[4]),
              ],
            ),
          ),

          // TOP NAV BAR
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(child: MyNavBar(onItemTap: _scrollToSection)),
          ),
        ],
      ),
    );
  }
}

class MyBlurBar extends StatelessWidget {
  const MyBlurBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      shadowColor: Colors.transparent,
      height: 40,
      elevation: 0,
      borderRadius: BorderRadius.zero,
      blur: 5,
      color: Colors.white.withOpacity(0.02),
      child: Container(),
    );
  }
}
