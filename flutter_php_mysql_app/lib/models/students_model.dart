class StudentModel {
  final id;
  final name;
  final email;
  final phone;

  StudentModel({this.id, this.name, this.email, this.phone});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone']);
  }

  Map<String, dynamic> toJsonAdd() {
    return {"name": name, "email": email, "phone": phone};
  }

  Map<String, dynamic> toJsonUpdateDelete() {
    return {"name": name, "email": email, "phone": phone, "id": id};
  }
}
