import 'package:dio/dio.dart';
import 'package:shopping/models/product-details.model.dart';
import 'package:shopping/models/product-list-item.model.dart';
import 'package:shopping/settings.dart';

class ProductRepository {
  Future<List<ProductListItemModel>> getAll() async {
    var url = "${Settings.apiUrl}${Settings.apiVersion}/products";

    var response = await Dio().get(url);
    return (response.data as List)
        .map((c) => ProductListItemModel.fromJson(c))
        .toList();
  }

  Future<ProductDetailsModel> get(String tag) async {
    var url = "${Settings.apiUrl}${Settings.apiVersion}/products/$tag";

    var response = await Dio().get(url);
    return ProductDetailsModel.fromJson(response.data);
  }

  Future<List<ProductListItemModel>> getByCategory(String category) async {
    var url = "${Settings.apiUrl}${Settings.apiVersion}/categories/$category/products";

    var response = await Dio().get(url);
    return (response.data as List)
        .map((c) => ProductListItemModel.fromJson(c))
        .toList();
  }
}
