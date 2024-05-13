import 'package:hive/hive.dart';

part 'users.g.dart';

// Run this command to convert .g.dart file >> flutter packages pub run build_runner build
@HiveType(typeId: 1)
class Users extends HiveObject {
  Users({
    required this.username,
    required this.contact,
    required this.pfNumber,
    required this.dateandtime,
    required this.rating,
  });

  @HiveField(0)
  String username;

  @HiveField(1)
  String contact;

  @HiveField(2)
  String pfNumber;

  @HiveField(3)
  String dateandtime;

  @HiveField(4)
  int rating;
}
