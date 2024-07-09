// class Product {
//   final String id;
//   final String name;
//   final String description;
//   final String imageUrl;
//   final double price;

//   Product({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.imageUrl,
//     required this.price,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       description: json['description'],
//       imageUrl: json['imageUrl'],
//       price: json['price'].toDouble(),
//     );
//   }
// }

class Product {
  final String uid;
  final String name;
  final String description;
  final String dateCreated;
  final int availableQuantity;
  // final double price;
  final String status;
  final List<String> photos;

  Product({
    required this.uid,
    required this.name,
    required this.description,
    required this.dateCreated,
    required this.availableQuantity,
    // required this.price,
    required this.status,
    required this.photos,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      uid: json['unique_id'] ?? '',
      name: json['name'] ?? '',
      description:
          json['description'] == 'null' ? '' : json['description'] ?? '',
      dateCreated: json['date_created'] ?? '',
      availableQuantity: (json['available_quantity'] ?? 0).toInt(),
      // price: (json['price'] is List)
      //     ? json['price'][0]['NGN'][0]
      //     : (json['price'] ?? 0).toDouble(),
      status: json['status'] ?? 'available',
      photos: (json['photos'] as List<dynamic>)
          .map((photo) =>
              'https://api.timbu.cloud/images/${photo['url'] as String}')
          .toList(),
    );
  }
}
