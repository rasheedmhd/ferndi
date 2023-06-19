import "package:flutter/material.dart";
import "package:uuid/uuid.dart";
import "package:app/models/wallets.dart";

const uuid = Uuid();

enum Category {
  Food,
  Groceries,
  Work,
  Health,
  Transportation,
  Miscellaneous,
  // more categories will be added later and
  // provided as default
  // Functionality will be added later as well
  // to allow users to add categories manually
}

const CategoryIcons = {
  // when users create they own categories will
  // be able to choose their own categories
  Category.Food: Icons.restaurant,
  Category.Groceries: Icons.shopping_cart,
  Category.Work: Icons.work,
  Category.Health: Icons.health_and_safety,
  Category.Transportation: Icons.flight_takeoff,
  Category.Miscellaneous: Icons.local_mall
};

class Spend {
  Spend({
    required this.name,
    required this.notes,
    required this.amount,
    required this.wallet,
    required this.category,
  })  : id = uuid.v4(),
        date = DateTime.now();

  final String id;
  // name or description of what you bought
  // or spent on
  final String name;
  final String notes;
  // amount spent
  final double amount;
  final DateTime date;
  // wallet paid from for the spend
  final Wallet wallet;
  final Category category;

  String get getCategory => category.name;
  String get getAmount => "GHS ${amount.toStringAsFixed(2)}";
  String get getWallet => wallet.name;
}
