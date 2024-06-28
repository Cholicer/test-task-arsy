class ItemModel {
  final int id;
  String title;
  String body;

  ItemModel({required this.id, required this.title, required this.body});

  // Convert from JSON map to Item object
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: int.parse(json['id']),
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  // Convert from Item object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
