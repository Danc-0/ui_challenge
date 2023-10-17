import 'package:flutter/material.dart';
import 'package:ui_challenge/app/values/colors.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 10,
      width: isActive ? 30 : 15,
      decoration: BoxDecoration(
          color: isActive ? PlantAppColors.primaryFeature : Colors.grey,
          border: isActive
              ? null
              : Border.all(color: PlantAppColors.primaryFeature),
          borderRadius: isActive
              ? const BorderRadius.all(Radius.circular(15))
              : BorderRadius.circular(10)),
    );
  }
}
