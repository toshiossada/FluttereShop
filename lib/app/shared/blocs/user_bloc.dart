import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/models/authenticate-user.model.dart';
import 'package:shopping/app/models/create-user-model.dart';
import 'package:shopping/app/models/user.model.dart';
import 'package:shopping/app/repositories/account_repository.dart';
import 'package:shopping/app/shared/settings.dart';

class UserBloc extends BlocBase {
  var _user = UserModel();
  var _accountRepository = AppModule.to.getDependency<AccountRepository>();
  final _userController = BehaviorSubject<UserModel>();
  String token;

  Stream<UserModel> get outUser => _userController.stream;

  UserBloc() {
    _user = null;

    var _ = loadUser();
  }

  Future<UserModel> authenticate(AuthenticateUserModel model) async {
    try {
      var prefs = await SharedPreferences.getInstance();

      var res = await _accountRepository.authenticate(model);

      _user = res;
      await prefs.setString('user', jsonEncode(res));

      _userController.add(_user);
      return res;
    } catch (ex) {
      _user = null;
      return null;
    }
  }

  Future<UserModel> create(CreateUserModel model) async {
    try {
      var res = await _accountRepository.create(model);

      return res;
    } catch (ex) {
      print(ex);
      _user = null;
      return null;
    }
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', null);

    _user = null;
    _userController.add(_user);
  }

  Future<UserModel> loadUser() async {
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('user');
    if (userData != null) {
      var res = UserModel.fromJson(jsonDecode(userData));
      Settings.user = res;
      _user = res;
      _userController.add(_user);

      return _user;
    }

    return null;
  }
}
