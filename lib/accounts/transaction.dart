import "package:app/ops/update/editSpend.dart";
import "package:flutter/material.dart";
import "package:app/models/schemas.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/providers/spends_provider.dart";
import "package:app/providers/wallets_provider.dart";
import "package:intl/intl.dart";


class TransactionItem extends ConsumerWidget {
  const TransactionItem(this.spend, {super.key});

  final Spend spend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void showSpendEditForm() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => EditSpendCard(spend),
        ),
      );
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
                              color: Color.fromARGB(255, 163, 9, 71),
                            ),
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color.fromARGB(255, 230, 243, 255),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Slide through to delete",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 128, 255),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  foregroundColor: const Color(0xFFFE4A49),
                  backgroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: (context) {
                    showSpendEditForm();
                  },
                  foregroundColor: const Color.fromARGB(255, 96, 150, 249),
                  backgroundColor: Colors.white,
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
                titleAlignment: ListTileTitleAlignment.top,
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
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(spend.notes),
                    Text(DateFormat("EEEE, dd MMMM").format(spend.createdAt)),
                    Text("Category:  ${spend.category?.name}"),
                  ],
                ),
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

class Transactions extends ConsumerStatefulWidget {
  final Wallet? wallet;
  const Transactions(this.wallet, {super.key});

  @override
  TransactionState createState() => TransactionState();
}

class TransactionState extends ConsumerState<Transactions> {
    late Wallet? wallet = ref.watch(getWallet(widget.wallet!.id));


  @override
  Widget build(BuildContext context) {
    final List<Spend> spends = ref.watch(spendsByWallet(wallet!.name));
    return TransactionList(spends);
  }
}

class TransactionList extends StatelessWidget {
  const TransactionList(this.spends, {super.key});

  final List<Spend> spends;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (spends.isEmpty)
          const Center(
            child: Text("You have no spends paid with this wallet yet!"),
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
                  return TransactionItem(spends[index]);
                },
              ),
            ),
          )
      ],
    );
  }
}
