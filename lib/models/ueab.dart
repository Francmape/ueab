class Ueab {
  Ueab({
    required this.name,
    required this.details,
    required this.image,
  });

  final String name;
  final String details;
  final String image;

  Ueab.fromJson({required Map<String, dynamic> json})
      : name = json['name'],
        details = json['details'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'details': details,
        'image': image,
      };
}
