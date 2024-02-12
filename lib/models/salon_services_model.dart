class SalonServicesModel {
  final String serviceName;
  final String description;
  final String image;
  final double price;
  final int discount;

  SalonServicesModel({
    required this.serviceName,
    required this.description,
    required this.image,
    required this.price,
    required this.discount,
  });

  // Receiving data from server
  factory SalonServicesModel.fromMap(Map<String, dynamic> map) {
    return SalonServicesModel(
      serviceName: map['serviceName'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: (map['price'] as num).toDouble(),
      discount: (map['discount'] as num).toInt(),
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'serviceName': serviceName,
  //     'price': price,
  //     'description': description,
  //   };
  // }

  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'description': description,
      'image': image,
      'price': price,
      'discount': discount,
    };
  }
}
