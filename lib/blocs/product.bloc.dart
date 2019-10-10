import 'package:shopping/models/product-details.model.dart';
import 'package:shopping/repositories/product.repository.dart';

class ProductBloc{
   final productRepository = new ProductRepository();

  Future<ProductDetailsModel> get(String tag) async {
    return productRepository.get(tag);
  }
}