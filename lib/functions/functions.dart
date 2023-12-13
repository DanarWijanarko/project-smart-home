import 'package:firebase_database/firebase_database.dart';
import 'package:tubes_smart_home/models/users_model.dart';
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

    rtdb.ref('temp/CardId').set('');
  }

  static Future handleAutoDeleteCardId(bool snapshot) async {
    if (snapshot) {
      Future.delayed(const Duration(seconds: 60), () {
        rtdb.ref('temp').child('/CardId').set('');
      });
    }
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
}
