import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:shopping/app/models/authenticate-user.model.dart';
import 'package:shopping/app/models/create-user-model.dart';
import 'package:shopping/app/models/user.model.dart';
import 'package:shopping/app/shared/custom_dio/custom_dio.dart';

class AccountRepository extends Disposable {
  final CustomDio dio;

  AccountRepository(this.dio);
  Future<UserModel> authenticate(AuthenticateUserModel model) async {
    var url = '/account/login';
    var response = await dio.client.post(url, data: model);

    return UserModel.fromJson(response.data);
  }

  Future<UserModel> create(CreateUserModel model) async {
    var url = '/account';
    var response = await dio.client.post(url, data: model);

    return (response.data as UserModel);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {}
}
