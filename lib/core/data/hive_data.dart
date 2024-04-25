import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class HiveData extends HiveObject {
  @HiveField(0)
  String email;
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  String jobRole;
  @HiveField(4)
  String phoneNumber;

  HiveData(
    this.email,
    this.firstName,
    this.lastName,
    this.jobRole,
    this.phoneNumber,
  );

  @override
  String toString() {
    return 'knovator{name: $email, contact: $firstName,lastName: $lastName,jobRole: $jobRole,phoneNumber:$phoneNumber,}';
  }
}
