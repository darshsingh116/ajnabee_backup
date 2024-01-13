import 'package:ajnabee/models/salon_services_model.dart';

class SalonModel {
  final String name;
  final String description;
  final int mobileNumber;
  final String address;
  final int rating;
  final List<SalonServicesModel> servicesList; // Added servicesList parameter
  final int viewCount; // Added viewCount parameter

  SalonModel(
    this.name,
    this.description,
    this.mobileNumber,
    this.address,
    this.rating,
    this.servicesList, // Added servicesList parameter in the constructor
    this.viewCount, // Added viewCount parameter in the constructor
  );

  // Receiving data from server
  factory SalonModel.fromMap(Map<String, dynamic> map) {
    // Assuming 'servicesList' is an array of maps in the data
    List<dynamic> servicesData = map['servicesList'] ?? [];
    List<SalonServicesModel> servicesList = servicesData
        .map((serviceMap) => SalonServicesModel.fromMap(serviceMap))
        .toList();

    return SalonModel(
      map['name'] as String,
      map['description'] as String,
      map['mobileNumber'] as int,
      map['address'] as String,
      map['rating'] as int,
      servicesList, // Assigning servicesList from the map data
      map['viewCount'] as int, // Added viewCount assignment
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'description': description,
  //     'mobileNumber': mobileNumber,
  //     'address': address,
  //     'rating': rating,
  //     'servicesList': servicesList.map((service) => service.toMap()).toList(),
  //     'viewCount': viewCount,
  //   };
  // }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'mobileNumber': mobileNumber,
      'address': address,
      'rating': rating,
      'servicesList': servicesList.map((service) => service.toJson()).toList(),
      'viewCount': viewCount,
    };
  }
}
