import 'package:flutter/material.dart';
import 'package:tubes_smart_home/components/_components.dart';

class MyNotificationCard extends StatelessWidget {
  const MyNotificationCard({
    super.key,
    required this.onPressed,
    required this.title,
    required this.subtitle,
  });

  final VoidCallback onPressed;
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: black.withOpacity(0.3),
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: red,
                    fontSize: 19.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: greyText,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          MyButtonCustom(
            onPressed: onPressed,
            bgColor: Colors.transparent,
            bgRadius: 100,
            onTapColor: darkOrange,
            onTapRadius: 100,
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.delete,
              color: black,
            ),
          ),
        ],
      ),
    );
  }
}
