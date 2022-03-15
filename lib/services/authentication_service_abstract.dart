import 'package:lab3_mis/model/userDto.dart';
import 'package:lab3_mis/model/user.dart';

abstract class BaseAuthService {

  User signIn(UserDto userDto);
  void signOut();
  User? getCurrentUser();

}