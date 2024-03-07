import "package:realm/realm.dart";
import 'package:app/models/schemas.dart';

const String categoryEmoji = "💸";
const String  categoryColor = "4294507263";

final onboardCategories = <Category>[
  Category(ObjectId(), "Health",            "🩺",  "4290958844", DateTime.now()),
  Category(ObjectId(), "Food",              "🍕",  "4294953123", DateTime.now()),
  Category(ObjectId(), "Electricity",       "⚡️",   "4290314102", DateTime.now()),
  Category(ObjectId(), "Groceries",         "🛒",  "4292192511", DateTime.now()),
  Category(ObjectId(), "Transportation",    "🚀",  "4294944424", DateTime.now()),
  Category(ObjectId(), "Miscellaneous",     "🧾",  "4294507263", DateTime.now()),
  Category(ObjectId(), "Child Care",        "💞",  "4285398959", DateTime.now()),
  Category(ObjectId(), "Lifestyle",         "🧢",  "4290314102", DateTime.now()),
  Category(ObjectId(), "Charity",           "❤️‍🩹",  "4290838514", DateTime.now()),
  Category(ObjectId(), "Banking",           "🏦",  "4292192511", DateTime.now()),
  Category(ObjectId(), "Clothes",           "👔",  "4294953123", DateTime.now()),
  Category(ObjectId(), "Loan",              "💵",  "4290838514", DateTime.now()),
  Category(ObjectId(), "Entertainment",     "🤪",  "4294953123", DateTime.now()),
  Category(ObjectId(), "Drinks",            "🥂",  "4294950892", DateTime.now()),
  Category(ObjectId(), "Bills",             "💸",  "4292192511", DateTime.now()),
  Category(ObjectId(), "Home",              "🏠",  "4290314102", DateTime.now()),
  Category(ObjectId(), "Insurance",         "🖤",  "4294944424", DateTime.now()),
  Category(ObjectId(), "Internet",          "🛜",  "4290314102", DateTime.now()),
  Category(ObjectId(), "Maintenance",       "🛠️",  "4294507263", DateTime.now()),
  Category(ObjectId(), "Rent",              "🏡",  "4294953123", DateTime.now()),
  Category(ObjectId(), "Water",             "🚿",  "4294944424", DateTime.now()),
  Category(ObjectId(), "Phone",             "📞",  "4290314102", DateTime.now()),
  Category(ObjectId(), "Education",         "📚",  "4294507263", DateTime.now()),
  Category(ObjectId(), "Gift",              "💖",  "4294953123", DateTime.now()),
  Category(ObjectId(), "Pharmacy",          "💊",  "4292542448", DateTime.now()),
  Category(ObjectId(), "Work",              "🛠️",  "4294950892", DateTime.now()),
  Category(ObjectId(), "Shopping",          "🛒",  "4292542448", DateTime.now()),
  Category(ObjectId(), "Fuel",              "⛽️",  "4294950892", DateTime.now()),
];


// 🛒🚀👶🏽👔💗🏦🧢💸💵🤡🤪🥂🥛🧾🏡🏠🪴🛠️📚🛠️🖤💘💝🩷❤️‍🩹💒💖💞💚❣️🛜🛖🚿📞⛽️