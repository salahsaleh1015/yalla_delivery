
class UserModel {
  final String userName;
  final String phoneNumber;
   String? userId;
  final String userLocation;
  final String userMail , userPassword;

  UserModel(
      {required this.userLocation,
      required this.userName,
      required this.phoneNumber,
        required this.userMail,
        required this.userPassword,
      this.userId});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userMail: json['userMail'],
      userPassword: json['userPassword'],
      phoneNumber: json['phoneNumber'],
      userLocation: json['userLocation'],
      userName: json['userName'],
      userId: json['userId'],

    );
  }

  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'userLocation': userLocation,
        'userName': userName,
        'userMail':userMail,
         'userPassword':userPassword,


        'userId': userId,
      };
}


