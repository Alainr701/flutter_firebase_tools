import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_tools/contacts/models/contact.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('contacts');



class ContactsServices {
  
  
  static Future<void> addContact(Contact contact) => _mainCollection
      .add(contact.toMap())
      .then((value) => print('Added Contact: $value'))
      .catchError((error) => print('Error adding Contact: $error'));

  static Future<QuerySnapshot> readContacts() {
    // _mainCollection.get()
    // .then((value) => value.docs.forEach((element) => print(element.data())));
    return _mainCollection.get();
  }

  static Future<void> updateContact(String id, Contact contact) =>
      _mainCollection
          .doc(id)
          .update(contact.toMap())
          .whenComplete(() => print("Note item updated in the database"))
          .catchError((error) => print('Error updating Contact: $error'));
}
