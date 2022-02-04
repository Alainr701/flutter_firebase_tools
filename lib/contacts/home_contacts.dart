import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_tools/contacts/inf_contacts.dart';
import 'package:flutter_firebase_tools/contacts/models/contact.dart';
import 'package:flutter_firebase_tools/contacts/services/contacts_services.dart';
import 'package:flutter_firebase_tools/contacts/widgets/alert_dialog.dart';

class HomeContacts extends StatefulWidget {
  const HomeContacts({Key? key}) : super(key: key);

  @override
  State<HomeContacts> createState() => _HomeContactsState();
}

class _HomeContactsState extends State<HomeContacts> {
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
        future: ContactsServices.readContacts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //  print(snapshot.data!.docs.length);
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final data =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                String name = data['name'];
                int phone = data['phone'];
                 String id = snapshot.data!.docs[index].id;
                //otra forma de hacerlo
                Contact c = Contact(
                    name: data['name'],
                    phone: data['phone'],
                    direccion: data['direccion'],
                    email: data['email'],
                    picture: data['picture'],
                    // fecha: DateTime.parse(data['fecha'] as Timestamp));
                    fecha:data['fecha']);
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://picsum.photos/id/237/200/300'),
                  ),
                  // snapshot.data!.docs[index].id,
                  title: Text(name),
                  subtitle: Text(phone.toString()),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InfContacts(id,contact: c)));
                        
                  },
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await showMyDialog(context);
          setState(() {});
        },
      ),
    );
  }
}
