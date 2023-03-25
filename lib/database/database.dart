import 'package:hive_flutter/hive_flutter.dart';

import '../model/users.dart';

class Database {
  static const String _boxName = 'users'; // Name of the box for the User class

  static Future<void> init() async {
    await Hive.initFlutter(); // Initialize Hive for Flutter
    Hive.registerAdapter(
        UserAdapter()); // Register the adapter for the User class
    await Hive.openBox<User>(
        _boxName); // Open the box for the User class and store it in a variable

    final usersBox = Hive.box<User>(_boxName); // Get the box for the User class

    if (usersBox.isEmpty) {
      usersBox.add(User(
          name: 'John Doe',
          email: 'johndoe@gmail.com',
          password: 'password123',
          role: 'customer'));
      usersBox.add(User(
          name: 'Jane Smith',
          email: 'janesmith@example.com',
          password: 'password123',
          role: 'agent'));
      usersBox.add(User(
          name: 'Admin',
          email: 'admin@example.com',
          password: 'password123',
          role: 'admin'));
    }
  }
}
