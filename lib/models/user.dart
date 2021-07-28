class User {
  User({
    required this.first_name,
    required this.last_name,
    required this.email_address,
    required this.phone_num,
  });

  final String first_name;
  final String last_name;
  final String email_address;
  final String phone_num;

  User.fromJson({required Map<String, dynamic> json})
      : first_name = json['first_name'],
        last_name = json['last_name'],
        email_address = json['email_address'],
        phone_num = json['phone_num'];

  Map<String, dynamic> toJson() => {
        'first_name': first_name,
        'last_name': last_name,
        'email_address': email_address,
        'phone_num': phone_num,
      };
}
