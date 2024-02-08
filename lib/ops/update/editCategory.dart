import "package:app/models/schemas.dart";
import "package:app/utility/schema/methods.dart";
import "package:flutter/material.dart";

class EditCategoryCard extends StatefulWidget {
  const EditCategoryCard({required this.category, super.key});

  final Category category;

  @override
  EditCategoryCardState createState() => EditCategoryCardState();
}

class EditCategoryCardState extends State<EditCategoryCard> {

  late Category categoryToEdit = getCategory(widget.category.id);
  late String name =  categoryToEdit.name;
  late String categoryEmoji = categoryToEdit.emoji;
  // late String categoryColor = categoryToEdit.color;
  late Color categoryColor = const Color.fromARGB(255, 205, 227, 255);
  // late Color defaultColor = const Color.fromARGB(255, 205, 227, 255);

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
        padding: const EdgeInsets.all(20),
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 227, 226, 226),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                TextFormField(
                  initialValue: name,
                  onChanged: _newName,
                  maxLength: 50,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(label: Text("Category Name")),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: categoryColor,
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
                        maxLength: 1,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(label: Text("Emoji")),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),  
                SizedBox(
                height: 40,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColor =
                            const Color.fromARGB(255, 194, 213, 252);
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
                        categoryColor =
                            const Color.fromARGB(255, 255, 250, 163);
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
                        categoryColor =
                      const Color.fromARGB(255, 255, 200, 163);
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color:const Color.fromARGB(255, 255, 200, 163),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColor =
                       const Color.fromARGB(255, 255, 191, 236);
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
                        categoryColor =
                      const Color.fromARGB(255, 184, 255, 118);
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
                        categoryColor =
                      const Color.fromARGB(255, 218, 255, 240);
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
                        categoryColor =
                       const Color.fromARGB(255, 192, 255, 242);
                      });
                    },
                    child: ClipOval(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      color:const  Color.fromARGB(255, 192, 255, 242),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryColor =
                       const Color.fromARGB(255, 255, 166, 168);
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
                        categoryColor =
                       const Color.fromARGB(255, 213, 168, 255);
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
                        categoryColor =
                          const Color.fromARGB(255, 109, 255, 175);
                      });
                    },
                    child: ClipOval(
                        // borderRadius: BorderRadius.circular(50),
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
              const SizedBox(
                height: 40,
              ),              
                FloatingActionButton.extended(
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
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
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
                      ));
                      return;
                    }
                    updateCategory(Category(
                      categoryToEdit.id,
                      name,
                      categoryEmoji,
                      "Color.fromARGB(255, 205, 227, 255)",             
                    ));
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Color.fromARGB(255, 231, 255, 245),
                      content: Column(
                        children: [
                          Text(
                            "Category successfully updated.",
                            style: TextStyle(
                                color: Color.fromARGB(255, 9, 163, 99)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Enjoy Delightful Spending.",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 9, 163, 99)),
                              ),
                              Icon(Icons.sentiment_very_satisfied,
                                  color: Color.fromARGB(255, 9, 163, 9))
                            ],
                          ),
                        ],
                      ),
                    ));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
      ),
    ));
  }
}
