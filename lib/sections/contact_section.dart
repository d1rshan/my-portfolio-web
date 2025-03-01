import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
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
            'Contact me',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Gap(10),
          // Here goes the contact options
        ],
      ),
    );
  }
}
