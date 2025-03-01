import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({
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
            'My Latest Work',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Gap(10),
          // Here goes the work cards
        ],
      ),
    );
  }
}
