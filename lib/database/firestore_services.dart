import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getUsers() async {
    final usersCollection = _firestoreInstance.collection('users');
    final querySnapshot = await usersCollection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> addUser(Map<String, dynamic> userData) async {
    final usersCollection = _firestoreInstance.collection('users');
    await usersCollection.add(userData);
  }

  // Other database interaction methods go here...
}
