import 'package:equatable/equatable.dart';

import '../../domain/entities/story_entity.dart';

class StoriesModel extends StoryEntity {
  StoriesModel({required super.firstName, required super.picture});

  factory StoriesModel.fromJson(Map<String, dynamic> json) {
    return StoriesModel(firstName: json['firstName'], picture: json['picture']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'firstName': firstName,
      'picture': picture
    };

    return data;
  }

  @override
  List<Object?> get props => [firstName, picture];
}
