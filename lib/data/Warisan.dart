class Warisan {
  int id;
  final String image;
  final String name;
  final String location;
  final String description;
  final String image2;
  final String description2;
  final String image3;
  final String description3;

  Warisan({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.description,
    required this.image2,
    required this.description2,
    required this.image3,
    required this.description3,
  });

  // Factory method to create an instance from a JSON object
  factory Warisan.fromJson(Map<String, dynamic> json) {
    return Warisan(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      location: json['location'],
      description: json['description'],
      image2: json['image2'],
      description2: json['description2'],
      image3: json['image3'],
      description3: json['description3'],
    );
  }

  // Method to convert an instance into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'location': location,
      'description': description,
      'image2': image2,
      'description2': description2,
      'image3': image3,
      'description3': description3,
    };
  }
}
