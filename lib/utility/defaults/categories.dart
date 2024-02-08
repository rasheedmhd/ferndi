import "package:realm/realm.dart";
import 'package:app/models/schemas.dart';

const String categoryEmoji = "💸";
const String  categoryColor = "Color.fromARGB(255, 205, 227, 255)";

final onboardCategories = <Category>[
  Category(ObjectId(), "Health",            "🩺",  "Color.fromARGB(255, 255, 166, 168)"),
  Category(ObjectId(), "Food",              "🍕",  "Color.fromARGB(255, 255, 191, 236)"),
  Category(ObjectId(), "Electricity",       "⚡️",   "Color.fromARGB(255, 255, 166, 168)"),
  Category(ObjectId(), "Groceries",         "🛒",  "Color.fromARGB(255, 192, 255, 242)"),
  Category(ObjectId(), "Transportation",    "🚀",  "Color.fromARGB(255, 255, 191, 236)"),
  Category(ObjectId(), "Miscellaneous",     "🧾",  "Color.fromARGB(255, 255, 191, 236)"),
  Category(ObjectId(), "Child Care",        "💞",  "Color.fromARGB(255, 255, 191, 236)"),
  Category(ObjectId(), "Lifestyle",         "🧢",  "Color.fromARGB(255, 255, 166, 168)"),
  Category(ObjectId(), "Charity",           "❤️‍🩹",  "Color.fromARGB(255, 255, 191, 236)"),
  Category(ObjectId(), "Banking",           "🏦",  "Color.fromARGB(255, 255, 191, 236)"),
  Category(ObjectId(), "Clothes",           "👔",  "Color.fromARGB(255, 192, 255, 242)"),
  Category(ObjectId(), "Loan",              "💵",  "Color.fromARGB(255, 255, 200, 163)"),
  Category(ObjectId(), "Entertainment",     "🤪",  "Color.fromARGB(255, 109, 255, 175)"),
  Category(ObjectId(), "Drinks",            "🥂",  "Color.fromARGB(255, 192, 255, 242)"),
  Category(ObjectId(), "Bills",             "💸",  "Color.fromARGB(255, 255, 191, 236)"),
  Category(ObjectId(), "Home",              "🏠",  "Color.fromARGB(255, 255, 200, 163)"),
  Category(ObjectId(), "Insurance",         "🖤",  "Color.fromARGB(255, 213, 168, 255)"),
  Category(ObjectId(), "Internet",          "🛜",  "Color.fromARGB(255, 184, 255, 118)"),
  Category(ObjectId(), "Maintenance",       "🛠️",  "Color.fromARGB(255, 255, 250, 163)"),
  Category(ObjectId(), "Rent",              "🏡",  "Color.fromARGB(255, 255, 250, 163)"),
  Category(ObjectId(), "Water",             "🚿",  "Color.fromARGB(255, 184, 255, 118)"),
  Category(ObjectId(), "Phone",             "📞",  "Color.fromARGB(255, 213, 168, 255)"),
  Category(ObjectId(), "Education",         "📚",  "Color.fromARGB(255, 255, 250, 163)"),
  Category(ObjectId(), "Gift",              "💖",  "Color.fromARGB(255, 184, 255, 118)"),
  Category(ObjectId(), "Pharmacy",          "💊",  "Color.fromARGB(255, 109, 255, 175)"),
  Category(ObjectId(), "Work",              "🛠️",  "Color.fromARGB(255, 255, 200, 163)"),
  Category(ObjectId(), "Shopping",          "🛒",  "Color.fromARGB(255, 213, 168, 255)"),
  Category(ObjectId(), "Fuel",              "⛽️",  "Color.fromARGB(255, 109, 255, 175)"),
];


// 🛒🚀👶🏽👔💗🏦🧢💸💵🤡🤪🥂🥛🧾🏡🏠🪴🛠️📚🛠️🖤💘💝🩷❤️‍🩹💒💖💞💚❣️🛜🛖🚿📞⛽️