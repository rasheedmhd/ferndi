import "package:app/ops/create/addCategory.dart";
import "package:app/Insights/category.dart";
import "package:app/utility/schema/methods.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class Categories extends ConsumerStatefulWidget {
  const Categories({super.key});

  @override
  SpendsPageState createState() => SpendsPageState();
}

class SpendsPageState extends ConsumerState<Categories> {
  void _addCategory() {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const AddCategoryCard(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final spendsCount = ref.watch(spendsCountProvider);

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: _addCategory,
              icon: const Icon(
                Icons.add,
                size: 34,
                color: Color.fromARGB(255, 255, 0, 128),
              ))
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
                // Text(
                //   "$totalSpendByCategory",
                //   style: TextStyle(
                //     fontSize: 30.0,
                //     color: Color.fromARGB(255, 5, 61, 135),
                //   ),
                // ),
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
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 5600,
              child: Categorys(),
            ),
          ],
        ));
  }
}
