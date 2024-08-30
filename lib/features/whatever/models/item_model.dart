class ItemModel {
  int id;
  String date;
  String description;
  String category;
  double amount;

  ItemModel({
    required this.id,
    required this.date,
    required this.description,
    required this.category,
    required this.amount,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json["id"],
      date: json["date"],
      description: json["description"],
      category: json["category"],
      amount: double.parse(json["amount"].toString()), // Преобразуем amount в double
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "date": date,
      "description": description,
      "category": category,
      "amount": amount,
    };
  }

  ItemModel copyWith({
    int? id,
    String? date,
    String? description,
    String? category,
    double? amount,
  }) {
    return ItemModel(
      id: id ?? this.id,
      date: date ?? this.date,
      description: description ?? this.description,
      category: category ?? this.category,
      amount: amount ?? this.amount,
    );
  }
}
