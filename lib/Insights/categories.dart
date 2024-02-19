import "package:app/ops/create/addCategory.dart";
import "package:app/Insights/category.dart";
import "package:app/utility/schema/methods.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  SpendsPageState createState() => SpendsPageState();
}

class SpendsPageState extends State<Categories> {
  void addCategory() {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const AddCategoryCard(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Categories"),
        actions: [
          IconButton(
            onPressed: addCategory,
            icon: const Icon(
              Icons.add,
              size: 34,
              color: Color.fromARGB(255, 163, 9, 71),
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
              const FaIcon(FontAwesomeIcons.arrowRightLong,
                  size: 23, color: Color.fromARGB(255, 151, 151, 151)),
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
