import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/riverpod.dart';

class MyNavBar extends ConsumerWidget {
  final Function(int) onItemTap;
  MyNavBar({super.key, required this.onItemTap});

  final List<String> navBarItems = [
    'Hey',
    'About',
    'Skills',
    'Work',
    'Contact'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          navBarItems.length,
          (index) => MyNavBarItem(
            item: navBarItems[index],
            index: index,
            isSelected: selectedIndex == index,
            onTap: () => onItemTap(index),
          ),
        ),
      ),
    );
  }
}

class MyNavBarItem extends ConsumerStatefulWidget {
  final String item;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const MyNavBarItem({
    super.key,
    required this.item,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  ConsumerState<MyNavBarItem> createState() => _MyNavBarItemState();
}

class _MyNavBarItemState extends ConsumerState<MyNavBarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(
          horizontal: widget.isSelected ? 15 : 8, vertical: 4),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(25),
            )
          : null,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => isHovered = true),
        onExit: (event) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Text(
            widget.item,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: (isHovered || widget.isSelected)
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.tertiary,
                ),
          ),
        ),
      ),
    );
  }
}
