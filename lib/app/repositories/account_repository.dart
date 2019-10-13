import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:shopping/app/models/authenticate-user.model.dart';
import 'package:shopping/app/models/create-user-model.dart';
import 'package:shopping/app/models/user.model.dart';
import 'package:shopping/app/settings.dart';

class AccountRepository extends Disposable {
  Future<UserModel> authenticate(AuthenticateUserModel model) async {
    var url = '${Settings.apiUrl}${Settings.apiVersion}/account/login';
    var response = await Dio().post(url, data: model);

    return UserModel.fromJson(response.data);
  }

  Future<UserModel> create(CreateUserModel model) async {
    var url = '${Settings.apiUrl}${Settings.apiVersion}/account';
    var response = await Dio().post(url, data: model);

    return UserModel.fromJson(response.data);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {}
}
