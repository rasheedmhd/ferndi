import "package:app/models/schemas.dart";
import "package:app/utility/schema/methods.dart";
import "package:flutter/material.dart";
import "package:realm/realm.dart";

class AddCategoryCard extends StatefulWidget {
  const AddCategoryCard({super.key});

  @override
  AddCategoryCardState createState() => AddCategoryCardState();
}

class AddCategoryCardState extends State<AddCategoryCard> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Add Category",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 5, 61, 135),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _nameController,
                  //maxLength: 50,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(label: Text("Category Name")),
                ),

                const SizedBox(
                  height: 40,
                ),

                FloatingActionButton.extended(
                  label: const Text(
                    "Save Category",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 5, 61, 135),
                  icon: const Icon(Icons.wallet, size: 34.0),
                  onPressed: () { 
                    createCategory(Category(
                      ObjectId(),
                      _nameController.text,
                    ));
                    _nameController.text = "";
                  },
                ),
              ],
            )));
  }
}
