import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_tools/contacts/models/contact.dart';
import 'package:flutter_firebase_tools/contacts/services/contacts_services.dart';
import 'package:flutter_firebase_tools/contacts/widgets/custom_text_field.dart';

Future<void> showMyDialog(context) async {
  final TextEditingController _controllerNombre = TextEditingController();

  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerTelefono = TextEditingController();

  final TextEditingController _controllerDireccion = TextEditingController();

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://www.w3schools.com/w3images/avatar2.png'),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                key: UniqueKey(),
                controller: _controllerNombre,
                decoration: CustomTextField.style(labelText: 'Nombre'),
              ),
              const SizedBox(height: 20),
              TextField(
                key: UniqueKey(),
                controller: _controllerEmail,
                decoration: CustomTextField.style(labelText: 'Email'),
              ),
              const SizedBox(height: 20),
              TextField(
                key: UniqueKey(),
                controller: _controllerTelefono,
                decoration: CustomTextField.style(labelText: 'Telefono'),
              ),
              const SizedBox(height: 20),
              TextField(
                key: UniqueKey(),
                controller: _controllerDireccion,
                decoration: CustomTextField.style(labelText: 'Direccion'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              if (_controllerNombre.text.isEmpty ||
                  _controllerTelefono.text.isEmpty) {
                print('Llenar todos los campos');
                return;
              }
              ContactsServices.addContact(Contact(
                name: _controllerNombre.text,
                email: _controllerEmail.text,
                phone: int.parse(_controllerTelefono.text),
                direccion: _controllerDireccion.text,
                fecha: Timestamp.now(),
              ));
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}
