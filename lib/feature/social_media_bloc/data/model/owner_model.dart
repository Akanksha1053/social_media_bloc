import 'package:news_app_assignment6/feature/social_media_bloc/domain/entities/owner_entity.dart';

class OwnerModel extends OwnerEntity {
  OwnerModel(
      {required super.id,
      required super.title,
      required super.firstName,
      required super.lastName,
      required super.picture});

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
        firstName: json['firstName'],
        id: json['id'],
        title: json['title'],
        lastName: json['lastName'],
        picture: json['picture']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture
    };

    return data;
  }
}
