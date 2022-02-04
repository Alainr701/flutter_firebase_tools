import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_tools/contacts/models/contact.dart';
import 'package:flutter_firebase_tools/contacts/services/contacts_services.dart';
import 'package:flutter_firebase_tools/contacts/widgets/custom_text_field.dart';

class InfContacts extends StatefulWidget {
  final Contact contact;
  final String id;

  const InfContacts(this.id, {Key? key, required this.contact})
      : super(key: key);

  @override
  State<InfContacts> createState() => _InfContactsState();
}

class _InfContactsState extends State<InfContacts> {
  final TextEditingController _controllerNombre = TextEditingController();

  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerTelefono = TextEditingController();

  final TextEditingController _controllerDireccion = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _controllerNombre.text = widget.contact.name;
    _controllerEmail.text = widget.contact.email ?? '';
    _controllerTelefono.text = widget.contact.phone.toString();
    _controllerDireccion.text = widget.contact.direccion ?? '';
  
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child:  const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://www.w3schools.com/w3images/avatar2.png'),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.id,
                style: const  TextStyle(fontSize: 20),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Contact contact = Contact(
            name: _controllerNombre.text,
            email: _controllerEmail.text,
            phone: int.parse(_controllerTelefono.text),
            direccion: _controllerDireccion.text,
            fecha: Timestamp.now(),
          );
          await ContactsServices.updateContact(widget.id,contact);
          Navigator.pop(context);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
