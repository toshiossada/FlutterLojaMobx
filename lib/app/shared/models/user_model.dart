import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String name;

  UserModel({
    this.email,
    this.name,
    this.id,
  });

  static UserModel fromDocument(DocumentSnapshot document) {
    return UserModel(
      id: document.documentID,
      name: document['name'] as String,
      email: document['email'] as String,
    );
  }
}
