import 'dart:math';

import 'package:flutter/material.dart';

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
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        transform: Matrix4.rotationZ(_angle),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isHovered
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.tertiary,
              ),
        ),
      ),
    );
  }
}
