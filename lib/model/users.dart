import 'package:hive/hive.dart';

part 'users.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String email;

  @HiveField(2)
  late String password;

  @HiveField(3)
  late String role;

  @HiveField(4)
  late DateTime dateCreated;

  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.role});
}
