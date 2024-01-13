class SalonServicesModel {
  final String serviceName;
  final double price;
  final String type;

  SalonServicesModel({
    required this.serviceName,
    required this.price,
    required this.type,
  });

  // Receiving data from server
  factory SalonServicesModel.fromMap(Map<String, dynamic> map) {
    return SalonServicesModel(
      serviceName: map['serviceName'] as String,
      price: (map['price'] as num).toDouble(),
      type: map['description'] as String,
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
      'price': price,
      'description': type,
    };
  }
}
