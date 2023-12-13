import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tubes_smart_home/components/_components.dart';
import 'package:tubes_smart_home/functions/functions.dart';

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({super.key});

  @override
  State<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  final FirebaseDatabase rtdb = FirebaseDatabase.instance;

  bool isDeviceAuto = true;

  @override
  void initState() {
    super.initState();
    Db.defaultValueDatabase('ToggleButton/isDeviceAuto', (bool value) {
      setState(() {
        isDeviceAuto = value;
      });
    });
  }

  void toggleAuto() {
    rtdb.ref('ToggleButton/isDeviceAuto').set(!isDeviceAuto);
    setState(() {
      isDeviceAuto = !isDeviceAuto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 65,
        backgroundColor: white2,
        title: Center(
          child: Text(
            "Pengaturan",
            style: TextStyle(
              color: black,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Accessibility Text Start
            Text(
              "Aksesibilitas",
              style: TextStyle(
                color: black,
                fontSize: 23,
                fontWeight: FontWeight.w700,
              ),
            ),
            // Accessibility Text End
      
            const SizedBox(height: 15),
      
            // Accessibility Item Start
            MyAccessibility(
              switchOnTap: toggleAuto,
              switchValue: isDeviceAuto,
              activeSwitchColor: darkGreen,
              activeBgColor: lightGreen,
            ),
            // Accessibility Item End
          ],
        ),
      ),
    );
  }
}
