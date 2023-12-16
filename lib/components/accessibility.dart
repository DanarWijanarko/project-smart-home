import 'package:flutter/material.dart';
import 'package:tubes_smart_home/components/_components.dart';

class MyAccessibility extends StatelessWidget {
  const MyAccessibility({
    super.key,
    required this.switchOnTap,
    required this.switchValue,
    required this.activeSwitchColor,
    required this.activeBgColor,
  });

  final VoidCallback switchOnTap;
  final bool switchValue;
  final Color activeSwitchColor, activeBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: switchValue ? activeBgColor : white,
        border: Border.all(
          color: grey,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: black.withOpacity(0.15),
            offset: const Offset(0.5, 1.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.6,
            child: Text(
              "Apakah Anda ingin menyalakan perangkat elektronik secara otomatis pada saat masuk rumah?",
              style: TextStyle(
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          MySwitchCustom(
            onTap: switchOnTap,
            switchValue: switchValue,
            inactiveTrackColor: grey,
            activeTrackColor: activeSwitchColor,
          ),
        ],
      ),
    );
  }
}
