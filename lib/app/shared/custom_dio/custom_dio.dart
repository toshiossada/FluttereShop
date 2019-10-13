import 'package:dio/dio.dart';
import 'package:shopping/app/shared/custom_dio/cache_interceptor.dart';
import 'package:shopping/app/shared/custom_dio/interceptor.dart';
import 'package:shopping/app/shared/settings.dart';



class CustomDio  {
  final Dio client;

  CustomDio(this.client){
    client.options = BaseOptions();
    client.options.baseUrl = '${Settings.apiUrl}${Settings.apiVersion}/';

    client.interceptors.add(CustomInterceptors());

    client.interceptors.add(CacheInterceptor());

    client.options.connectTimeout = 5000;
  }
}