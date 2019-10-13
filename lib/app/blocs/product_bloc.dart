import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:shopping/app/models/product-details.model.dart';
import 'package:shopping/app/repositories/product_repository.dart';

class ProductBloc extends BlocBase {
  final productRepository = new ProductRepository();

  final _productController = BehaviorSubject<Future<ProductDetailsModel>>();

  Stream<Future<ProductDetailsModel>> get outProduct =>
      _productController.stream;



  Future<ProductDetailsModel> get(String tag) async {
    var p = productRepository.get(tag);
    _productController.add(p);
    return p;
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
