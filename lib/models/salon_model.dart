class SalonModel {
  final String name;
  final String description;
  final int mobileNumber;
  SalonModel(this.name, this.description, this.mobileNumber);

  // receiving data from server
  factory SalonModel.fromMap(map) {
    return SalonModel(
      map['name'] as String,
      map['description'] as String,
      map['mobileNumber'] as int,
    );
  }
  //i guess not needed for now 

  // Map<String, dynamic> toMap() {
  //   return {
  //     'uid': uid,
  //     'name': name,
  //     'description': description,
  //     'mobileNumber': mobileNumber,
  //   };
  // }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'mobileNumber' : mobileNumber,
    };
  }
}
