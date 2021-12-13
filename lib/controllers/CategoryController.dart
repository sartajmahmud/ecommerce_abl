import 'package:grocery_app/repositories/CategoryRepository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/Category.dart';
import '../models/Category.dart';
import '../models/Product.dart';

class CategoryController extends ControllerMVC{

  List categories = [];
  getCategories() async {
    final Stream<Category> stream = await getCategory();
    stream.listen((Category _slide) {
      print('Category'+_slide.name);
      setState(() => categories.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

  List categoryProducts = [];
  getCategoriesProducts(Category category) async {
    final Stream<Product> stream = await getCategoryProducts(category.id);
    stream.listen((Product _slide) {
      print('Product'+_slide.id);
      setState(() => categoryProducts.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }
}