import 'package:dio/dio.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/models/authenticate-user.model.dart';
import 'package:shopping/app/shared/blocs/user_bloc.dart';
import 'package:shopping/app/shared/custom_dio/custom_dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    print('Request[${options.method}] => PATH: ${options.path}');

    var auth = AppModule.to.getBloc<UserBloc>();
    var dio = AppModule.to.getDependency<CustomDio>();
    var user = await auth.loadUser();
    if (user != null) {
      if (auth.token == null) {
        dio.client.lock();
        auth.token = user.token;

        options.headers.addAll({"Authorization": auth.token});

        dio.client.unlock();
      }
    }

    print('Authorization: ${options.headers['Authorization']}');

    // TODO: implement onRequest
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('Response[${response.statusCode}] => PATH: ${response.request.path}');

    // TODO: implement onResponse
    return super.onResponse(response);
  }

  @override
  Future onError(DioError e) async {
    print('Response[${e.response.statusCode}] => PATH: ${e.request.path}');
    var auth = AppModule.to.getBloc<UserBloc>();
    var user = await auth.loadUser();

    if (user != null && e.response.statusCode == 401) {
      var dio = AppModule.to.getDependency<CustomDio>();

      var options = e.response.request;

      if (user.token != options.headers['Authorization']) {
        options.headers['Authorization'] = user.token;
        return dio.client.request(options.path, options: options);
      }
      dio.client.lock();
      dio.client.interceptors.responseLock.lock();
      dio.client.interceptors.errorLock.lock();

      return auth
          .authenticate(AuthenticateUserModel(
              username: user.username, password: user.password))
          .then((d) {
        options.headers['Authorization'] = d.token;
      }).whenComplete(() {
        dio.client.unlock();
        dio.client.interceptors.responseLock.unlock();
        dio.client.interceptors.errorLock.unlock();
      }).then((e) => dio.client.request(options.path, options: options));
    }

    // TODO: implement onError
    return super.onError(e);
  }
}
