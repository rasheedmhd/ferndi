import "package:realm/realm.dart";
import 'package:app/models/schemas.dart';

const String categoryEmoji = "💸";
const String  categoryColor = "4294507263";

final onboardCategories = <Category>[
  Category(ObjectId(), "Health",            "🩺",  "4290958844"),
  Category(ObjectId(), "Food",              "🍕",  "4294953123"),
  Category(ObjectId(), "Electricity",       "⚡️",   "4290314102"),
  Category(ObjectId(), "Groceries",         "🛒",  "4292192511"),
  Category(ObjectId(), "Transportation",    "🚀",  "4294944424"),
  Category(ObjectId(), "Miscellaneous",     "🧾",  "4294507263"),
  Category(ObjectId(), "Child Care",        "💞",  "4285398959"),
  Category(ObjectId(), "Lifestyle",         "🧢",  "4290314102"),
  Category(ObjectId(), "Charity",           "❤️‍🩹",  "4290838514"),
  Category(ObjectId(), "Banking",           "🏦",  "4292192511"),
  Category(ObjectId(), "Clothes",           "👔",  "4294953123"),
  Category(ObjectId(), "Loan",              "💵",  "4290838514"),
  Category(ObjectId(), "Entertainment",     "🤪",  "4294953123"),
  Category(ObjectId(), "Drinks",            "🥂",  "4294950892"),
  Category(ObjectId(), "Bills",             "💸",  "4292192511"),
  Category(ObjectId(), "Home",              "🏠",  "4290314102"),
  Category(ObjectId(), "Insurance",         "🖤",  "4294944424"),
  Category(ObjectId(), "Internet",          "🛜",  "4290314102"),
  Category(ObjectId(), "Maintenance",       "🛠️",  "4294507263"),
  Category(ObjectId(), "Rent",              "🏡",  "4294953123"),
  Category(ObjectId(), "Water",             "🚿",  "4294944424"),
  Category(ObjectId(), "Phone",             "📞",  "4290314102"),
  Category(ObjectId(), "Education",         "📚",  "4294507263"),
  Category(ObjectId(), "Gift",              "💖",  "4294953123"),
  Category(ObjectId(), "Pharmacy",          "💊",  "4292542448"),
  Category(ObjectId(), "Work",              "🛠️",  "4294950892"),
  Category(ObjectId(), "Shopping",          "🛒",  "4292542448"),
  Category(ObjectId(), "Fuel",              "⛽️",  "4294950892"),
];


// 🛒🚀👶🏽👔💗🏦🧢💸💵🤡🤪🥂🥛🧾🏡🏠🪴🛠️📚🛠️🖤💘💝🩷❤️‍🩹💒💖💞💚❣️🛜🛖🚿📞⛽️