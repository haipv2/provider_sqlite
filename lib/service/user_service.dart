import 'package:provider_base/config/locator.dart';
import 'package:provider_base/dao/user_dao.dart';

import 'base_service.dart';

class UserService extends BaseService {
  @override
  void init() {
  }

  UserDao _userDao = locator<UserDao>();

}