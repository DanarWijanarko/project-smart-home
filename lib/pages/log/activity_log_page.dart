import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes_smart_home/components/_components.dart';
import 'package:tubes_smart_home/functions/functions.dart';

class MyActivityLog extends StatefulWidget {
  const MyActivityLog({super.key});

  @override
  State<MyActivityLog> createState() => _MyActivityLogState();
}

class _MyActivityLogState extends State<MyActivityLog> {
  final FirebaseDatabase rtdb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 65,
        backgroundColor: white2,
        title: Center(
          child: Text(
            "Log Aktifitas",
            style: TextStyle(
              color: black,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: FirebaseAnimatedList(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        sort: (DataSnapshot a, DataSnapshot b) => Sorting.desc(a, b),
        query: rtdb.ref('ActivityLog'),
        defaultChild: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: darkOrange,
          ),
        ),
        itemBuilder: (context, snapshot, animation, index) {
          Map user = snapshot.value as Map;
          user['key'] = snapshot.key;
          return MyActivityLogCard(
            onPressed: () async {
              bool confirmDelete =
                  await Db.showDeleteConfirmationDialog(context);
              if (confirmDelete == true) {
                rtdb.ref('ActivityLog').child(user['key']).remove();
              }
            },
            name: user['name'].toString(),
            email: user['email'].toString(),
            time: ConvertTime.toTimeAgo(user['time']),
            status: "Membuka Pintu",
          );
        },
      ),
    );
  }
}
