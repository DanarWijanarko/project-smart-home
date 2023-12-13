// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tubes_smart_home/components/_components.dart';

class MyButtonCustom extends StatelessWidget {
  MyButtonCustom({
    super.key,
    required this.onPressed,
    required this.bgColor,
    required this.bgRadius,
    required this.onTapColor,
    required this.onTapRadius,
    required this.padding,
    this.onTapPadding = const EdgeInsets.all(0),
    this.width,
    this.height,
    required this.child,
  });

  final Color onTapColor, bgColor;
  final VoidCallback onPressed;
  final double onTapRadius, bgRadius;
  final EdgeInsetsGeometry padding, onTapPadding;
  final Widget child;
  double? width, height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: onTapPadding,
        minimumSize: Size.zero,
        foregroundColor: onTapColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(onTapRadius),
        ),
      ),
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(bgRadius),
        ),
        child: child,
      ),
    );
  }
}

class MyMenuButtonCustom extends StatelessWidget {
  const MyMenuButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return MyButtonCustom(
          onPressed: () {
            controller.isOpen ? controller.close() : controller.open();
          },
          bgColor: Colors.transparent,
          bgRadius: 100,
          onTapColor: darkOrange,
          onTapRadius: 100,
          padding: const EdgeInsets.all(5),
          child: Icon(
            Icons.add,
            color: black,
            size: 35,
          ),
        );
      },
      style: MenuStyle(
        backgroundColor: MaterialStatePropertyAll(white),
        minimumSize: const MaterialStatePropertyAll(Size.zero),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
        shadowColor: MaterialStatePropertyAll(black.withOpacity(0.6)),
      ),
      alignmentOffset: const Offset(-170, 5),
      menuChildren: <Widget>[
        MenuItemButton(
          style: MenuItemButton.styleFrom(
            foregroundColor: darkOrange,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            minimumSize: Size.zero,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/add-person');
          },
          child: SizedBox(
            width: 175,
            child: Center(
              child: Text(
                "Tambahkan Pengguna",
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 1.3,
          color: grey,
        ),
        MenuItemButton(
          style: MenuItemButton.styleFrom(
            foregroundColor: darkOrange,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            minimumSize: Size.zero,
          ),
          onPressed: () {},
          child: SizedBox(
            width: 175,
            child: Center(
              child: Text(
                "Tambahkan Aksesoris",
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyNavbarButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final int? selectedIndex, index;

  const MyNavbarButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.selectedIndex,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(5),
        minimumSize: Size.zero,
        foregroundColor: darkOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(55),
        ),
      ),
      child: Icon(
        icon,
        size: 35,
        color: selectedIndex == index ? darkOrange : black,
      ),
    );
  }
}
