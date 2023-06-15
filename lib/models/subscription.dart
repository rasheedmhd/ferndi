import "package:flutter/material.dart";
import "package:uuid/uuid.dart";

const uuid = Uuid();

class Subscription {
  Subscription({
    required this.name,
    required this.amount,
    this.wallet,
    required this.duration,
  }) : id = uuid.v4();

  final String id;
  final String name;
  final double amount;
  // Right now, All my subscriptions are been paid from my Credit Card
  // So ideally I don't need the specify when creating a subscription
  // Also in Settings, I will have settings that allows users to set default
  // wallets for spends
  // Drop down menu of all wallets created by the user
  final String? wallet; // Name of wallet subscriptions are been paid from
  final String
      duration; // An enum of whether the subscription is for a month or year.
}
