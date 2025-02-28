import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/content.dart';
import 'package:portfolio/riverpod.dart';

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

  final ScrollController _scrollController = ScrollController();

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
          Center(
            child: SizedBox(
              width: 1200,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Padding(
                      key: section1Key,
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            height: screen.height - 60,
                            child: Image.asset(
                              'images/bg.png',
                              fit: BoxFit.fitHeight,
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
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        // ABOUT SECTION

                        Container(
                          key: section2Key,
                          padding: EdgeInsets.all(30),
                          color: Colors.white,
                          height: screen.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('About',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                              Text(
                                Content.about,
                              ),
                            ],
                          ),
                        ),

                        // SKILLS
                        Container(
                          key: section3Key,
                          padding: EdgeInsets.all(30),
                          color: Colors.black,
                          height: screen.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Skills',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: Colors.white),
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
                        Container(
                          key: section4Key,
                          padding: EdgeInsets.all(30),
                          color: Colors.white,
                          height: screen.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Projects',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              Text(Content.about),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(gap),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: MyNavBar(
                keys: [section1Key, section2Key, section3Key, section4Key]),
          ),
        ],
      ),
    );
  }
}

class MyNavBar extends ConsumerWidget {
  final List<GlobalKey> keys;
  const MyNavBar({super.key, required this.keys});

  // Function to scroll to a specific section
  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    final list = ['Hey', 'About', 'Skills', 'Projects'];
    return Container(
      height: 200,
      width: 100,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            ref.read(selectedIndexProvider.notifier).state = index;
            scrollToSection(keys[index]);
          },
          child: Text(
            list[index],
            style: TextStyle(
              fontSize: 22,
              color:
                  index != selectedIndex ? Colors.grey.shade700 : Colors.white,
            ),
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
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/bg.png'),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
              .withOpacity(0.066), // Dark overlay (adjust opacity as needed)
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 3.0, // Subtle blur for softness
                color:
                    Colors.black.withOpacity(0.25), // Light shadow for contrast
                offset: Offset(1, 1), // Gentle offset to lift text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
