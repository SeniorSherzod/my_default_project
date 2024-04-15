class UserModel {
  final String uuid;
  final String firstname;
  final String lastname;
  final DateTime birthDate;
  final int age;
  final String profileImage;

  // Constructor
  UserModel({
    required this.uuid,
    required this.firstname,
    required this.lastname,
    required this.birthDate,
    required this.age,
    required this.profileImage,
  });

  UserModel copyWith(
      {String? uuid,
      String? firstname,
      String? lastname,
      DateTime? birthDate,
      int? age,
      String? profileImage}) {
    return UserModel(
        uuid: uuid ?? this.uuid,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        birthDate: birthDate ?? this.birthDate,
        age: age ?? this.age,
        profileImage: profileImage ?? this.profileImage);
  }

  // Factory method to create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uuid: json['uuid'] ?? "",
        firstname: json['firstname'] ?? '',
        lastname: json['lastname'] ?? '',
        birthDate: DateTime.parse(json['birthDate'] ?? ''),
        age: json['age'] ?? 0,
        profileImage: json['profileImage'] ?? '',
      );

  // Method to convert UserModel to JSON
  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'birthDate': birthDate.toIso8601String(),
        'age': age,
        'profileImage': profileImage,
      };

  // Method to generate JSON for updating UserModel
  Map<String, dynamic> toUpdateJson() => {
        'uuid': uuid,
        'firstname': firstname,
        'lastname': lastname,
        'birthDate': birthDate.toIso8601String(),
        'age': age,
        'profileImage': profileImage,
      };

  static initial() => UserModel(
      uuid: "",
      firstname: "",
      lastname: "",
      birthDate: DateTime.now(),
      age: 0,
      profileImage: "");
}
