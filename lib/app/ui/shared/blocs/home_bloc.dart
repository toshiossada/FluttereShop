import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/models/category-list-item.model.dart';
import 'package:shopping/app/models/product-list-item.model.dart';
import 'package:shopping/app/repositories/category_repository.dart';
import 'package:shopping/app/repositories/product_repository.dart';

class HomeBloc extends BlocBase {
  final categoryRepository = AppModule.to.getDependency<CategoryRepository>();
  final productRepository = AppModule.to.getDependency<ProductRepository>();

  List<ProductListItemModel> _products;
  List<CategoryListItemModel> _categories;
  var _selectedCategory = 'todos';

  final _productsController = BehaviorSubject<List<ProductListItemModel>>();
  final _categoriesController = BehaviorSubject<List<CategoryListItemModel>>();
  final _selectedCategoryController = BehaviorSubject<String>();

  Stream<List<ProductListItemModel>> get outProducts =>
      _productsController.stream;
  Stream<List<CategoryListItemModel>> get outCategories =>
      _categoriesController.stream;
  Stream<String> get outSelectedCategory => _selectedCategoryController.stream;

  HomeBloc() {
    _selectedCategoryController.add(_selectedCategory);
    getCategories();
    getProducts();
  }

  getCategories() {
    _selectedCategoryController.add(_selectedCategory);
    categoryRepository.getAll().then((data) {
      data.add(CategoryListItemModel(id: 'all', title: 'Todos', tag: 'all'));
      this._categories = data;
      _categoriesController.add(this._categories);
    });
  }

  getProducts() {
    productRepository.getAll().then((data) {
      this._products = data;
      _productsController.add(this._products);
    });
  }

  getProductsByCategory() {
    if (_selectedCategory == 'all')
      getProducts();
    else
      productRepository.getByCategory(_selectedCategory).then((data) {
        this._products = data;
        _productsController.add(this._products);
      });
  }

  changeCategory(tag) {
    _selectedCategory = tag;
    notifyListeners();
    _selectedCategoryController.add(_selectedCategory);
    _products = null;
    getProductsByCategory();
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
