import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:shopping/app/models/category-list-item.model.dart';
import 'package:shopping/app/settings.dart';

class CategoryRepository extends Disposable {
  Future<List<CategoryListItemModel>> getAll() async {
    var url = '${Settings.apiUrl}${Settings.apiVersion}/categories';

    var response = await Dio().get(url);

    return (response.data as List)
        .map((c) => CategoryListItemModel.fromJson(c))
        .toList();
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {}
}
