import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:shopping/app/models/category-list-item.model.dart';
import 'package:shopping/app/shared/custom_dio/custom_dio.dart';

class CategoryRepository extends Disposable {
  final CustomDio dio;

  CategoryRepository(this.dio);
  
  Future<List<CategoryListItemModel>> getAll() async {
    var url = '/categories';

    var response = await dio.client.get(url);

    return (response.data as List)
        .map((c) => CategoryListItemModel.fromJson(c))
        .toList();
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {}
}
