import "package:app/ops/create/addCategory.dart";
import "package:app/Insights/category.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/providers/categories_provider.dart";

class Categories extends ConsumerWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesCount = ref.watch(categoriesNotifier).length;

    void addCategory() {
      showModalBottomSheet(
        showDragHandle: true,
        context: context,
        isScrollControlled: true,
        builder: (ctx) => const AddCategoryCard(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Categories"),
        actions: [
          IconButton(
            onPressed: addCategory,
            icon: const Icon(
              Icons.add,
              size: 34,
              color: Color.fromARGB(255, 5, 61, 135),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Row(
            children: [
              const Text(
                "All Categories",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 5, 61, 135),
                ),
              ),
              const Spacer(),
              Text(
                " $categoriesCount ",
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 151, 151, 151),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: CategoryCard(),
          ),
        ],
      ),
    );
  }
}
