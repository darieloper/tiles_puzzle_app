class User {
  final String id;
  final String name;
  final String username;
  final String? location;

  User({
    required this.id,
    required this.name,
    required this.username,
    this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      location: json['location'],
    );
  }

  @override
  String toString() {
    return '''
    { id: "$id", name: "$name", username: "$username", location: "$location"}
    ''';
  }
}
