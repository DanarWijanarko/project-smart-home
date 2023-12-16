import 'package:flutter/material.dart';
import 'package:tubes_smart_home/components/_components.dart';

class MyAccessories extends StatelessWidget {
  const MyAccessories({
    super.key,
    required this.switchOnTap,
    required this.switchValue,
    required this.image,
    required this.activeSwitchColor,
    required this.activeBgColor,
    required this.title,
    required this.subtitle,
  });

  final VoidCallback switchOnTap;
  final bool switchValue;
  final AssetImage image;
  final Color activeSwitchColor, activeBgColor;
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width / 2 - 19.5,
      height: 165,
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: switchValue ? activeBgColor : white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: grey, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                width: 35,
                height: 35,
                image: image,
              ),
              MySwitchCustom(
                onTap: switchOnTap,
                switchValue: switchValue,
                inactiveTrackColor: grey,
                activeTrackColor: activeSwitchColor,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 102,
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        color: greyText,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    switchValue ? 'On' : 'Off',
                    style: TextStyle(
                      color: switchValue ? activeSwitchColor : black,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
