import 'package:flutter/material.dart';

import '../../app/values/colors.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final Function() onPressed;

  const RoundedButton({
    super.key,
    this.color = PlantAppColors.primaryFeature,
    this.iconData = Icons.arrow_forward_rounded,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle().copyWith(
        backgroundColor: MaterialStateProperty.all<Color>(
          PlantAppColors.primaryFeature,
        ),
        elevation: MaterialStateProperty.all<double>(5.0),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const CircleBorder(),
        ),
        iconSize: MaterialStateProperty.all<double>(
          MediaQuery.of(context).size.height * 0.045,
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size.fromHeight(
            MediaQuery.of(context).size.height * 0.075,
          ),
        ),
      ),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}
