import 'package:dio/dio.dart';
import 'package:shopping/models/authenticate-user.model.dart';
import 'package:shopping/models/create-user-model.dart';
import 'package:shopping/models/user.model.dart';
import 'package:shopping/settings.dart';

class AccountRepository{
  Future<UserModel> authenticate(AuthenticateUserModel model) async{
    var url = '${Settings.apiUrl}${Settings.apiVersion}/account/login';
    var response = await Dio().post(url, data: model);

    return UserModel.fromJson(response.data);
  }
  Future<UserModel> create(CreateUserModel model) async{
    var url = '${Settings.apiUrl}${Settings.apiVersion}/account';
    var response = await Dio().post(url, data: model);

    return UserModel.fromJson(response.data);
  }
}