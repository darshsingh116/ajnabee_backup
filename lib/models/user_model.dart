class UserModel {
  String? uid;
  String? name;
  String? email;
  int? mobileNumber;
  UserModel({this.uid, this.name, this.email, this.mobileNumber});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      mobileNumber: map['mobileNumber'],
    );
  }
  //i guess not needed for now 

  // Map<String, dynamic> toMap() {
  //   return {
  //     'uid': uid,
  //     'name': name,
  //     'email': email,
  //     'mobileNumber': mobileNumber,
  //   };
  // }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid' : uid,
      'mobileNumber' : mobileNumber,
    };
  }
}
