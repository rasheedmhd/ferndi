import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/providers/categories_provider.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:flutter/material.dart";

class AddCategoriesCard extends ConsumerStatefulWidget {
  const AddCategoriesCard({super.key});

  @override
  AddCategoriesCardState createState() => AddCategoriesCardState();
}

class AddCategoriesCardState extends ConsumerState<AddCategoriesCard> {
  bool categoriesCreated = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        children: [
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.heartCircleCheck,
              size: 25.0,
              color: Color.fromARGB(255, 251, 127, 39),
            ),
            title: Text("Health"),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bowlRice,
              size: 25.0,
              color: Color.fromARGB(255, 61, 177, 250),
            ),
            title: Text("Food"),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bolt,
              size: 25.0,
              color: Color.fromARGB(255, 255, 128, 0),
            ),
            title: Text("Electricity"),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.cartShopping,
              size: 25.0,
              color: Color.fromARGB(255, 2, 218, 117),
            ),
            title: Text("Groceries"),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.thumbsUp,
              size: 25.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: Text("Miscellaneous"),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.plus,
              size: 25.0,
              color: Color.fromARGB(255, 11, 101, 218),
            ),
            title: Text("23 More"),
          ),
          const SizedBox(
            height: 35,
          ),
          FloatingActionButton.extended(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            label: const Text(
              "          Add All          ",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 5, 61, 135),
            onPressed: () {
              if (categoriesCreated == false) {
                ref.read(categoriesNotifier.notifier).addCategories();
                ScaffoldMessenger.of(context).clearSnackBars();
                categoriesCreated = true;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 231, 255, 245),
                    content: Column(
                      children: [
                        Text(
                          "Categories successfully created.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 9, 163, 99),
                          ),
                        ),
                        Text(
                          "Swipe right to get started.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 9, 163, 99),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                ref.read(categoriesNotifier.notifier).addCategories();
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 255, 231, 241),
                    content: Column(
                      children: [
                        Text(
                          "Categories created already.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 163, 9, 71),
                          ),
                        ),
                        Text(
                          "Swipe right to get started.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 163, 9, 71),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 70,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back),
              Text("    swipe"),
            ],
          ),
        ],
      ),
    );
  }
}
