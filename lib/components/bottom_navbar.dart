import 'package:flutter/material.dart';
import 'package:tubes_smart_home/components/_components.dart';
import 'package:tubes_smart_home/functions/routes.dart';

class MyNavbarCustom extends StatefulWidget {
  const MyNavbarCustom({super.key});

  @override
  State<MyNavbarCustom> createState() => _MyNavbarCustomState();
}

class _MyNavbarCustomState extends State<MyNavbarCustom> {
  int selectedIndex = 0;

  final pages = RouteGenerator.pages;

  void handlePagesChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(color: white2, boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: black.withOpacity(0.3),
            offset: const Offset(0, -2),
            blurStyle: BlurStyle.outer,
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            3,
            (index) => MyNavbarButton(
              onPressed: () {
                handlePagesChanged(index);
              },
              icon: [
                Icons.home_outlined,
                Icons.history,
                Icons.settings_outlined,
              ][index],
              selectedIndex: selectedIndex,
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
