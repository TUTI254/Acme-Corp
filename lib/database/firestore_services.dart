import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference usersCollection = _firestore.collection('users');
final CollectionReference ticketsCollection = _firestore.collection('tickets');

class FirebaseCrudUsers {
//CRUD method here

//  Create User
  static Future<Response> createUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String role,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = usersCollection.doc();
    //creare user
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "role": role,
    };
    await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

// Read User
  Stream<QuerySnapshot> readUsers() {
    CollectionReference readUsersCollection = usersCollection;
    return readUsersCollection.snapshots();
  }

// Update User
  static Future<Response> updateUsers({
    required String name,
    required String phone,
    required String role,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = usersCollection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "phone": phone,
      "role": role,
    };
    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}

class FirebaseCrudTickets {
//CRUD method here

// Create Ticket
  static Future<Response> createTicket({
    required String number,
    required String name,
    required String description,
    required String category,
    required String status,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = ticketsCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "number": number,
      "name": name,
      "description": description,
      "category": category,
      "status": status,
    };
    await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

// Read Ticket
  Stream<QuerySnapshot> readTickets() {
    CollectionReference readTicketsCollection = ticketsCollection;
    return readTicketsCollection.snapshots();
  }

// Update Ticket
  static Future<Response> updateTickets({
    required String name,
    required String description,
    required String category,
    required String status,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = ticketsCollection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "description": description,
      "category": category,
      "status": status,
    };
    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Ticket Sucessfully updated to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
