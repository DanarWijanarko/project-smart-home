import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tubes_smart_home/models/users_model.dart';
import 'package:tubes_smart_home/components/_components.dart';
import 'package:timeago/timeago.dart' as timeago;

class ConvertTime {
  static toTimeAgo(int epocTime) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(epocTime);
    timeago.setLocaleMessages('id', timeago.IdMessages());

    return timeago.format(date, locale: 'id').toString();
  }
}

class Sorting {
  static desc(a, b) {
    return b.key!.compareTo(a.key.toString());
  }
}

class Db {
  static final rtdb = FirebaseDatabase.instance;

  static defaultValueDatabase(String path, void Function(bool) onDataChange) {
    rtdb.ref(path).onValue.listen(
      (DatabaseEvent event) {
        bool data = event.snapshot.value as bool;
        onDataChange(data);
      },
    );
  }

  static Future createUsers(User user) async {
    final userRef = rtdb.ref('Users/${user.id}');

    final jsonData = user.toJson();
    await userRef.set(jsonData);

    rtdb.ref('temp/CardId').set('null');
  }

  static handleCardIdData(bool snapshot, DatabaseEvent event, controller) {
    final data = event.snapshot.value;

    if (snapshot) {
      if (data.toString() == 'null') {
        controller.text = '';
      } else {
        controller.text = data.toString();
      }
    }
  }

  static Future<bool> showDeleteConfirmationDialog(BuildContext context) async {
    bool confirmDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Konfirmasi Hapus",
          style: TextStyle(
            color: red,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          "Apakah anda Yakin ?",
          style: TextStyle(
            color: greyText,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          MyButtonCustom(
            onPressed: () => Navigator.pop(context, false),
            bgColor: white,
            bgRadius: 25,
            onTapColor: grey,
            onTapRadius: 25,
            padding: const EdgeInsets.all(3),
            child: Text(
              "Batal",
              style: TextStyle(color: black),
            ),
          ),
          MyButtonCustom(
            onPressed: () => Navigator.pop(context, true),
            bgColor: white,
            bgRadius: 25,
            onTapColor: red,
            onTapRadius: 25,
            padding: const EdgeInsets.all(3),
            child: Text(
              "Hapus",
              style: TextStyle(color: red),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );

    return confirmDelete;
  }
}
