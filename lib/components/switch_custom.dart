import 'package:flutter/material.dart';

class MySwitchCustom extends StatelessWidget {
  const MySwitchCustom({
    super.key,
    required this.onTap,
    required this.switchValue,
    required this.inactiveTrackColor,
    required this.activeTrackColor,
    this.activeThumbColor = const Color(0xfffafafa),
    this.inactiveThumbColor = const Color(0xfffafafa),
  });

  final VoidCallback onTap;
  final bool switchValue;
  final Color inactiveTrackColor,
      activeTrackColor,
      activeThumbColor,
      inactiveThumbColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 60,
        height: 35,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: switchValue ? activeTrackColor : inactiveTrackColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment:
              switchValue ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              width: 31,
              height: 33,
              decoration: BoxDecoration(
                color: switchValue ? activeThumbColor : inactiveThumbColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
