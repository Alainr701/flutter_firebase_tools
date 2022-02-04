import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_tools/contacts/home_contacts.dart';

void main()async {
  //firebase core
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: ListView.builder(
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(pages[index]['title']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => pages[index]['page'],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> pages = [
  {
    'title': 'Aplicacion de Contactos',
    'page': const HomeContacts(),
  },
];
