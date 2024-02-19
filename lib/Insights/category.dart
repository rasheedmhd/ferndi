import "package:flutter/material.dart";
import "package:app/models/schemas.dart";
import "package:app/utility/schema/methods.dart";
import "package:app/ops/update/editCategory.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:realm/realm.dart";

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category, {super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    void showCategoryEditForm() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => EditCategoryCard(category: category),
        ),
      );
    }

    final int spendsPerCategory = getSpendsByCategory(category.name).length;
    final int totalSpendAmountPerCategory = getSpendsByCategory(category.name)
        .map((spend) => (spend.amount))
        .fold(0, (value, element) => value + element);

    // We are pulling the Category color from the database,
    // Remember that it was stored as an String so we have to convert it back into an
    // Integer before we can reconstruct the Color and use in the UI
    late int categoryColorInt = int.tryParse(category.color) ?? 4290958844;
    late Color categoryColor = Color(categoryColorInt);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Slidable(
            // Specify a key if the Slidable is dismissible.
            key: ValueKey(category.id),

            // The start action pane is the one at the left or the top side.
            startActionPane: ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: const ScrollMotion(),

              // A pane can dismiss the Slidable.
              dismissible: DismissiblePane(onDismissed: () {
                deleteCategory(category);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Color.fromARGB(255, 255, 231, 241),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Category Deleted",
                        style:
                            TextStyle(color: Color.fromARGB(255, 163, 9, 71)),
                      ),
                    ],
                  ),
                ));
              }),

              // All actions are defined in the children parameter.
              children: [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: (context) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Color.fromARGB(255, 230, 243, 255),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Slide through to delete",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 128, 255)),
                          ),
                        ],
                      ),
                    ));
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: (context) {
                    showCategoryEditForm();
                  },
                  backgroundColor: const Color.fromARGB(255, 96, 150, 249),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),

            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: categoryColor,
                  child: Text(
                    category.emoji,
                    style: const TextStyle(
                      fontSize: 27,
                      color: Color.fromARGB(255, 153, 152, 153),
                    ),
                  ),
                ),
                subtitle: Text("${spendsPerCategory} Transactions"),
                title: Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Text(
                  "- GHS ${totalSpendAmountPerCategory.toString()}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 163, 9, 71),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 0,
            color: Color.fromARGB(255, 227, 226, 226),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryList(categories: categories);
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.categories});

  final RealmResults<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (categories.isEmpty)
          const Center(
            child: Text("You have no Categories yet!"),
          )
        else
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryItem(categories[index]);
                },
              ),
            ),
          )
      ],
    );
  }
}
