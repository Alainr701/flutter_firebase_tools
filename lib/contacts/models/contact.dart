import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
    Contact({
        required this.name,
        this.email,
        required this.phone,
        this.direccion,
        required this.fecha,
        this.picture,
    });

    String name;
    String? email;
    int phone;
    String? direccion;
    Timestamp fecha;
    String? picture;

    factory Contact.fromJson(String str) => Contact.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Contact.fromMap(Map<String, dynamic> json) => Contact(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        direccion: json["direccion"],
        fecha: json["fecha"],
        picture: json["picture"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "phone": phone,
        "direccion": direccion,
        // "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "fecha": Timestamp.now(),
        "picture": picture,
    };
}
