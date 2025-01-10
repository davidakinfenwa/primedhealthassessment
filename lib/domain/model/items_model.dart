class Item {
  final String title;
  final String image;
  final String description;
  final double discountPrice;
  final double price;
  final DateTime lastUpdated;
  final String time;

  Item({
    required this.title,
    required this.image,
    required this.description,
    required this.discountPrice,
    required this.price,
    required this.lastUpdated,
    required this.time,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'],
      image: json['image'],
      description: json['description'],
      discountPrice: json['discountPrice'],
      price: json['price'],
      lastUpdated: DateTime.parse(json['lastUpdated']),
      time: json['time'],
    );
  }
}
