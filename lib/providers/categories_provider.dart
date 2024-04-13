import 'package:app/providers/spends_provider.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:app/models/schemas.dart';
import "package:realm/realm.dart";
import 'package:app/utility/defaults/categories.dart';

final getCategory = Provider.family<Category, ObjectId>((ref, id) {
  final category = ref
      .watch(categoriesNotifier)
      .where((category) => category.id == id)
      .first;
  return category;
});

final getIncomeCategory = Provider((ref) {
  final category = ref
      .watch(categoriesNotifier)
      .where((c) => c.name.toLowerCase() == "Income".toLowerCase())
      .firstOrNull;
  return category;
});

// Returns all the spends recorded under a particular category
final getSpendsByCategory =
    Provider.family<List<Spend>, String>((ref, categoryName) {
  final spendsByCategory = ref
      .watch(spendsNotifier)
      .where((spend) => spend.category?.name == categoryName);
  return spendsByCategory.toList();
});

final getTotalSpendAmountPerCategory =
    Provider.family<double, String>((ref, categoryName) {
  return ref
      .watch(getSpendsByCategory(categoryName))
      .map((spend) => (spend.amount))
      .fold(0, (value, element) => value + element);
});

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
