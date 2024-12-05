import 'package:hive/hive.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0) // Ensure the typeId is unique within your app
class UserModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String password;

  @HiveField(3)
  String dateOfBirth;

  @HiveField(4)
  String? image;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.dateOfBirth,
     this.image,
  });

  @override
  String toString(){
    return 'UserModel(name: $name, email: $email, password: $password, dateOfBirth: $dateOfBirth, image: $image)';

  }
}
