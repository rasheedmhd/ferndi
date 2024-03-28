import "package:app/models/schemas.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/providers/categories_provider.dart";
import 'package:flutter/services.dart';

class EditCategoryCard extends ConsumerStatefulWidget {
  const EditCategoryCard({required this.category, super.key});

  final Category category;

  @override
  EditCategoryCardState createState() => EditCategoryCardState();
}

class EditCategoryCardState extends ConsumerState<EditCategoryCard> {
  late Category categoryToEdit = ref.watch(getCategory(widget.category.id));
  late String name = categoryToEdit.name;
  late String categoryEmoji = categoryToEdit.emoji;
  // categoryColorInt stores the int value of the Color
  // The int is converted into a String and stored in RealmDb
  // This is a complete Hack because RealmDb doesn't support Flutter
  // Color Data Type
  late int categoryColorInt = int.tryParse(categoryToEdit.color) ?? 4290958844;
  // By using categoryColorInt above, which is the Value of the color const Color.fromARGB(255, 255, 193, 188), we can reconstruct the Color and displays it in the UI
  // We then use this reconstructed color to Apply to the Circle depicting the Selected Color
  // of the Category, giving real time feedback to the User, letting them know which
  // color they are saving to the database
  late Color categoryColor = Color(categoryColorInt);

  void _newEmoji(String selectedEmoji) {
    setState(() {
      categoryEmoji = selectedEmoji;
    });
  }

  void _newName(String typedName) {
    name = typedName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Category"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 20, 15),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 227, 226, 226),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: name,
                onChanged: _newName,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(
                      50), // Limit the number of characters
                ],
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    label: Text("Category Name"), border: InputBorder.none),
              ),
              const Divider(
                color: Color.fromARGB(255, 227, 226, 226),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(categoryColorInt),
                        child: Text(
                          categoryEmoji,
                          style: const TextStyle(fontSize: 27),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: categoryEmoji,
                      onChanged: _newEmoji,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(
                            1), // Limit the number of characters
                      ],
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          label: Text("Emoji"), border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Color.fromARGB(255, 227, 226, 226),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColorInt =
                            const Color.fromARGB(255, 194, 213, 252).value;
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 194, 213, 252),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColorInt =
                            const Color.fromARGB(255, 255, 250, 163).value;
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 255, 250, 163),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColorInt =
                            const Color.fromARGB(255, 248, 250, 255).value;
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 248, 250, 255),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColorInt =
                            const Color.fromARGB(255, 255, 200, 163).value;
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 255, 200, 163),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColorInt =
                            const Color.fromARGB(255, 255, 191, 236).value;
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 255, 191, 236),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColorInt =
                            const Color.fromARGB(255, 184, 255, 118).value;
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 184, 255, 118),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColorInt =
                            const Color.fromARGB(255, 218, 255, 240).value;
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 218, 255, 240),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColorInt =
                            const Color.fromARGB(255, 192, 255, 242).value;
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 192, 255, 242),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColorInt =
                            const Color.fromARGB(255, 255, 166, 168).value;
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 255, 166, 168),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColorInt =
                            const Color.fromARGB(255, 213, 168, 255).value;
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 213, 168, 255),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColorInt =
                            const Color.fromARGB(255, 109, 255, 175).value;
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 109, 255, 175),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: FloatingActionButton.extended(
                  heroTag: "save",
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  label: const Text(
                    "          save          ",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                  onPressed: () {
                    if (name.isEmpty) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color.fromARGB(255, 255, 231, 241),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "A Category must have a name",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 163, 9, 71)),
                              ),
                              Text(
                                "Please add a name before saving.",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 163, 9, 71)),
                              ),
                            ],
                          ),
                        ),
                      );
                      return;
                    }
                    ref.read(categoriesNotifier.notifier).updateCategory(
                          Category(categoryToEdit.id, name, categoryEmoji,
                              categoryColorInt.toString(), DateTime.now()),
                        );
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color.fromARGB(255, 231, 255, 245),
                        content: Column(
                          children: [
                            Text(
                              "Category successfully updated.",
                              style: TextStyle(
                                color: Color.fromARGB(255, 9, 163, 99),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Enjoy Delightful Spending.",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 9, 163, 99),
                                  ),
                                ),
                                Icon(
                                  Icons.sentiment_very_satisfied,
                                  color: Color.fromARGB(255, 9, 163, 9),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
