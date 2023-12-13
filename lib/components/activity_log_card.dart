import 'package:flutter/material.dart';
import 'package:tubes_smart_home/components/_components.dart';

class MyActivityLogCard extends StatelessWidget {
  const MyActivityLogCard({
    super.key,
    required this.onPressed,
    required this.name,
    required this.email,
    required this.time,
    required this.status,
  });

  final VoidCallback onPressed;
  final String name, email, time, status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: black.withOpacity(0.2),
            offset: const Offset(0.5, 1.5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: darkOrange,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(
                    color: greyText,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // const SizedBox(height: 4),
                // Text(
                //   status,
                //   style: TextStyle(
                //     color: black,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: black,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                MyButtonCustom(
                  onPressed: onPressed,
                  bgColor: Colors.transparent,
                  bgRadius: 100,
                  onTapColor: darkOrange,
                  onTapRadius: 100,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  child: Text(
                    "Hapus",
                    style: TextStyle(
                      color: red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
