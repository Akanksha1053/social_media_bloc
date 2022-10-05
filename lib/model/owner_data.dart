class OwnerData {
  String? id;
  String? title;
  late String firstName;
  late String lastName;
  late String picture;

  OwnerData(
      {this.id,
      this.title,
      required this.firstName,
      required this.lastName,
      required this.picture});

  OwnerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['picture'] = picture;
    return data;
  }
}
