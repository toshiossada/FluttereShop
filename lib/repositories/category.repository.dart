import 'package:dio/dio.dart';
import 'package:shopping/models/category-list-item.model.dart';
import 'package:shopping/settings.dart';

class CategoryRepository{
  Future<List<CategoryListItemModel>> getAll() async{
    var url = '${Settings.apiUrl}${Settings.apiVersion}/categories';

    var response = await Dio().get(url);

    return (response.data as List)
            .map((c) => CategoryListItemModel.fromJson(c))
            .toList();
  }
}