import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes_smart_home/components/_components.dart';
import 'package:tubes_smart_home/functions/functions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseDatabase rtdb = FirebaseDatabase.instance;

  bool isLampOn = false;
  bool isGateOpened = false;
  bool isAcOn = false;
  bool isMotion =false;

  @override
  void initState() {
    super.initState();
    Db.defaultValueDatabase('ToggleButton/IsGateOpened', (bool value) {
      setState(() {
        isGateOpened = value;
      });
    });
    Db.defaultValueDatabase('ToggleButton/IsLampOn', (bool value) {
      setState(() {
        isLampOn = value;
      });
    });
    Db.defaultValueDatabase('ToggleButton/IsAcOn', (bool value) {
      setState(() {
        isAcOn = value;
      });
    });
  }

  void toggleGate() {
    rtdb.ref('ToggleButton/IsGateOpened').set(!isGateOpened);
    setState(() {
      isGateOpened = !isGateOpened;
    });
  }

  void toggleLamp() {
    rtdb.ref('ToggleButton/IsLampOn').set(!isLampOn);
    setState(() {
      isLampOn = !isLampOn;
    });
  }

  void toggleAc() {
    rtdb.ref('ToggleButton/IsAcOn').set(!isAcOn);
    setState(() {
      isAcOn = !isAcOn;
    });
  }
    void toggleMotion() {
    rtdb.ref('ToggleButton/IsAcOn').set(!isAcOn);
    setState(() {
      isMotion = !isMotion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      appBar: AppBar(
        backgroundColor: white2,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 8, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "HomePimpa",
                  style: TextStyle(
                    color: black,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.6,
                  ),
                ),
                const MyMenuButtonCustom(),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Accessories Text Start
              Text(
                "Aksesoris",
                style: TextStyle(
                  color: black,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // Accessories Text End

              const SizedBox(height: 15),

              // Accessories Items Start
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StreamBuilder(
                        stream: rtdb.ref('ToggleButton/GateStatus').onValue,
                        builder: (context, snapshot) {
                          final data = snapshot.data?.snapshot.value.toString();
                          return MyAccessories(
                            switchOnTap: toggleGate,
                            switchValue: isGateOpened,
                            image: const AssetImage("assets/images/gate.png"),
                            activeSwitchColor: darkBlue2,
                            activeBgColor: lightBlue2,
                            title: "Front Gate",
                            subtitle: data.toString(),
                          );
                        },
                      ),
                      MyAccessories(
                        switchOnTap: toggleAc,
                        switchValue: isAcOn,
                        image: const AssetImage(
                            "assets/images/air-conditioner.png"),
                        activeSwitchColor: darkOrange,
                        activeBgColor: lightOrange,
                        title: "Air Condition",
                        subtitle: "Posisi AC",
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyAccessories(
                        switchOnTap: toggleLamp,
                        switchValue: isLampOn,
                        image: const AssetImage("assets/images/lamp.png"),
                        activeSwitchColor: darkBlue1,
                        activeBgColor: lightBlue1,
                        title: "Main Lamp",
                        subtitle: "Posisi Lampu",
                      ),
                      MyAccessories(
                        switchOnTap: toggleLamp,
                        switchValue: isLampOn,
                        image: const AssetImage("assets/images/motion.png"),
                        activeSwitchColor: darkGreen,
                        activeBgColor: lightGreen,
                        title: "Motion Sensor",
                        subtitle: "Posisi Sensor",
                      ),
                    ],
                  ),
                ],
              ),
              // Accessories Items End

              const SizedBox(height: 15),

              // Notification Text Start
              Text(
                "Notifikasi",
                style: TextStyle(
                  color: black,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // Notification Text End

              const SizedBox(height: 15),

              // Notification Items Start
              FirebaseAnimatedList(
                sort: (a, b) => Sorting.desc(a, b),
                query: rtdb.ref('Notification'),
                shrinkWrap: true,
                itemBuilder: (context, snapshot, animation, index) {
                  Map notify = snapshot.value as Map;
                  notify['key'] = snapshot.key;
                  return MyNotificationCard(
                    onPressed: () {},
                    title: notify['title'].toString(),
                    subtitle: notify['subtitle'].toString(),
                  );
                },
              ),
              // Notification Items End
            ],
          ),
        ),
      ),
    );
  }
}
