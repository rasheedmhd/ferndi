import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/providers/spends_provider.dart";
import "package:app/models/schemas.dart";
import "package:app/ops/update/editSpend.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class SpendItem extends ConsumerWidget {
  const SpendItem(this.spend, {super.key});

  final Spend spend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    void showSpendEditForm() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => EditSpendCard(spend)));
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Slidable(
            // Specify a key if the Slidable is dismissible.
            key: ValueKey(spend.id),

            // The start action pane is the one at the left or the top side.
            startActionPane: ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: const ScrollMotion(),

              // A pane can dismiss the Slidable.
              dismissible: DismissiblePane(
                onDismissed: () {
                  ref.read(spendsNotifier.notifier).deleteSpend(spend);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color.fromARGB(255, 255, 231, 241),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Spend Deleted",
                            style: TextStyle(
                                color: Color.fromARGB(255, 163, 9, 71)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

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
                    ),);
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: (context) {
                    showSpendEditForm();
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
                  backgroundColor:
                      Color(int.tryParse(spend.category!.color) ?? 4290958844),
                  child: Text(
                    spend.category!.emoji,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                title: Text(
                  spend.name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text("${spend.notes}"),
                trailing: Text(
                  "- ${spend.getAmount}",
                  style: const TextStyle(
                    fontSize: 16,
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

class Spends extends ConsumerWidget {
  const Spends({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spends = ref.watch(spendsNotifier);
    return SpendList(spends);
  }
}

class SpendList extends StatelessWidget {
  const SpendList(this.spends, {super.key});

  final List<Spend> spends;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (spends.isEmpty)
          const Center(
            child: Text("You have no spends yet!"),
          )
        else
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: spends.length,
                itemBuilder: (BuildContext context, int index) {
                  return SpendItem(spends[index]);
                },
              ),
            ),
          )
      ],
    );
  }
}
