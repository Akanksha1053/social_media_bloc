import 'package:news_app_assignment6/feature/social_media_bloc/domain/entities/post_entity.dart';

import 'owner_model.dart';

class PostModel extends PostEntity {
  PostModel(
      {required super.id,
      required super.image,
      required super.likes,
      required super.publishDate,
      required super.owner,
      required super.tags,
      required super.text,
      super.isBookmarked});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'],
        image: json['image'],
        likes: json['likes'],
        tags: json['tags'].cast<String>(),
        text: json['text'],
        publishDate: json['publishDate'],
        owner:
            json['owner'] != null ? OwnerModel.fromJson(json['owner']) : null,
        isBookmarked: json['bookmark'] ?? false);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'image': image,
      'likes': likes,
      'tags': tags,
      'text': text,
      'publishDate': publishDate,
      'owner': (owner as OwnerModel).toJson(),
      'isBookmarked': isBookmarked
    };

    return data;
  }

  PostModel copyWith({
    String? id,
    String? image,
    int? likes,
    List<String>? tags,
    String? text,
    String? publishDate,
    OwnerModel? owner,
    bool? isBookmarked,
  }) {
    return PostModel(
      isBookmarked: isBookmarked ?? this.isBookmarked,
      id: id ?? this.id,
      image: image ?? this.image,
      likes: likes ?? this.likes,
      tags: tags ?? this.tags,
      text: text ?? this.text,
      publishDate: publishDate ?? this.publishDate,
      owner: owner ?? this.owner,
    );
  }

  @override
  List<Object?> get props =>
      [id, image, likes, tags, text, publishDate, owner, isBookmarked];
}
