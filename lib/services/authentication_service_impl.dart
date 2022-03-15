import 'package:lab3_mis/model/user.dart';
import 'package:lab3_mis/services/authentication_service_abstract.dart';
import 'package:lab3_mis/data/inMemory.dart';
import 'package:lab3_mis/model/userDto.dart';


class SimpleAuthService extends BaseAuthService {

  static final SimpleAuthService _instance = SimpleAuthService._internal();
  factory SimpleAuthService() => _instance;
  SimpleAuthService._internal();

  User? _currentUser;

  @override
  User? getCurrentUser() {
    return _currentUser;
  }

  @override
  User signIn(UserDto userDto) {
    User user = User(id: userDto.id);
    _currentUser = user;
    return user;
  }

  @override
  void signOut() {
    _currentUser = null;
  }
}