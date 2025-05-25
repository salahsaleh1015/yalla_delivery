class UserModel {
  final String userName;
  final String phoneNumber;
  final String? userId;
  final String userLocation;

  UserModel(
      {required this.userLocation,
      required this.userName,
      required this.phoneNumber,
      this.userId});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
        'userId': userId,
      };
}
