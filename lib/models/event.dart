class Event {
  Event({
    required this.name,
    required this.details,
    required this.date,
    required this.image,
  });

  final String name;
  final String details;
  final DateTime date;
  final String image;

  Event.fromJson({required Map<String, dynamic> json})
      : name = json['name'],
        details = json['details'],
        date = json['date'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'details': details,
        'date': date,
        'image': image,
      };
}
