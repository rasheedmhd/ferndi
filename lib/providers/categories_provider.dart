import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:app/models/schemas.dart';
import 'package:app/utility/defaults/categories.dart';


final categoriesStream = StreamProvider((ref) => realm.all<Category>().changes);

final categoriesNotifier =
    NotifierProvider<CategoryNotifier, List<Category>>(CategoryNotifier.new);

class CategoryNotifier extends Notifier<List<Category>> {
  @override
  List<Category> build() {
    return ref.watch(categoriesStream).value?.results.toList() ?? [];
  }

  void updateCategory(Category category) {
    realm.write(() {
      realm.add<Category>(category, update: true);
    });
  }


  // Create a new Category record and persist to db
  void createCategory(Category category) {
    realm.write(() {
      realm.add(category);
    });
  }

  // Create a bunch of Categories when getting onboard
  void addCategories() {
    realm.write(() {
      realm.addAll(onboardCategories);
    });
  }

  void deleteCategory(Category category) {
    realm.write(() {
      realm.delete(category);
    });
  }

}
