import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:shopping/app/models/product-details.model.dart';
import 'package:shopping/app/models/product-list-item.model.dart';
import 'package:shopping/app/shared/custom_dio/custom_dio.dart';

class ProductRepository extends Disposable {
  final CustomDio dio;

  ProductRepository(this.dio);

  Future<List<ProductListItemModel>> getAll() async {
    var url = "/products";

    var response = await dio.client.get(url,
          options: Options(extra: {'refresh': false}));
    return (response.data as List)
        .map((c) => ProductListItemModel.fromJson(c))
        .toList();
  }

  Future<ProductDetailsModel> get(String tag) async {
    var url = "/products/$tag";

    var response = await dio.client.get(url,
          options: Options(extra: {'refresh': false}));
    return ProductDetailsModel.fromJson(response.data);
  }

  Future<List<ProductListItemModel>> getByCategory(String category) async {
    var url =
        "/categories/$category/products";

    var response = await dio.client.get(url,
          options: Options(extra: {'refresh': false}));
    return (response.data as List)
        .map((c) => ProductListItemModel.fromJson(c))
        .toList();
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {}
}
