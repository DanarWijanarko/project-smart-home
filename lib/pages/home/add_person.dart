import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tubes_smart_home/components/_components.dart';
import 'package:tubes_smart_home/functions/functions.dart';
import 'package:tubes_smart_home/models/users_model.dart';

class MyAddPersonPage extends StatefulWidget {
  const MyAddPersonPage({super.key});

  @override
  State<MyAddPersonPage> createState() => _MyAddPersonPageState();
}

class _MyAddPersonPageState extends State<MyAddPersonPage> {
  final _formKey = GlobalKey<FormState>();

  final _cardIdController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  final FirebaseDatabase rtdb = FirebaseDatabase.instance;

  void saveButton() {
    if (_formKey.currentState!.validate()) {
      final user = User(
        id: _cardIdController.text,
        name: _nameController.text,
        email: _emailController.text,
      );
      Db.createUsers(user);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 8,
              right: 20,
            ),
            child: Row(
              children: [
                MyButtonCustom(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  bgColor: Colors.transparent,
                  bgRadius: 100,
                  onTapColor: darkOrange,
                  onTapRadius: 100,
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: black,
                    size: 35,
                  ),
                ),
                const SizedBox(width: 11),
                Text(
                  "Tambahkan Pengguna",
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: rtdb.ref('temp/CardId').onValue,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: darkOrange,
                  strokeWidth: 5,
                ),
              );
            }
            Db.handleCardIdData(
              snapshot.hasData,
              snapshot.data!,
              _cardIdController,
            );
            return Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextFieldCustom(
                      controller: _cardIdController,
                      textFieldTitle: "Nomor Id pada Kartu RFID",
                      hintText: "Tempelkan Kartu pada RFID",
                      hintField: "Terisi Otomatis*",
                      readOnly: true,
                      validator: FormBuilderValidators.required(
                        errorText: "Tolong Tempelkan Kartu pada RFID...!",
                      ),
                    ),
                    const SizedBox(height: 15),
                    MyTextFieldCustom(
                      controller: _nameController,
                      textFieldTitle: "Masukkan Nama Lengkap",
                      hintText: "e.g. Han So-hee",
                      validator: FormBuilderValidators.required(
                        errorText: "Tolong Masukkan Nama Pengguna...!",
                      ),
                    ),
                    const SizedBox(height: 15),
                    MyTextFieldCustom(
                      controller: _emailController,
                      textFieldTitle: "Masukkan Alamat Email",
                      hintText: "e.g. sohee@example.com",
                      validator: FormBuilderValidators.required(
                        errorText: "Tolong Masukkan Alamat Email...!",
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: MyButtonCustom(
                        onPressed: saveButton,
                        bgColor: darkOrange,
                        bgRadius: 15,
                        onTapColor: darkOrange,
                        onTapRadius: 15,
                        onTapPadding: const EdgeInsets.all(3),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Simpan",
                            style: TextStyle(
                              color: white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
