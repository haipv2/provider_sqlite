
class User  {
  final String name;
  final String age;
  final String password;
  final String id;

  User({this.id, this.name, this.age, this.password});

  factory User.fromMap(Map<String, dynamic> json) => new User(
      id: json['id'],
      name: json['name'],
      password: json['password'],
      age: json['age']);

  Map<String, dynamic> toMap() =>
      {'id': id, 'name': name, 'password': password, 'age': age};
}
