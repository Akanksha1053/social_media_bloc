import 'package:equatable/equatable.dart';

import 'owner_data.dart';

class PostData extends Equatable {
  String? id;
  String? image;
  int? likes;
  List<String>? tags;
  String? text;
  String? publishDate;
  OwnerData? owner;
  bool isBookmarked = false;

  PostData(
      {this.id,
      this.image,
      this.likes,
      this.publishDate,
      this.owner,
      this.tags,
      this.text,
      required this.isBookmarked});

  PostData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    likes = json['likes'];
    tags = json['tags'].cast<String>();
    text = json['text'];
    publishDate = json['publishDate'];
    owner = json['owner'] != null ? OwnerData.fromJson(json['owner']) : null;
    isBookmarked;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['likes'] = likes;
    data['tags'] = tags;
    data['text'] = text;
    data['publishDate'] = publishDate;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    return data;
  }

  PostData copyWith({
    String? id,
    String? image,
    int? likes,
    List<String>? tags,
    String? text,
    String? publishDate,
    OwnerData? owner,
    bool? isBookmarked,
  }) {
    return PostData(
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
  List<Object?> get props => [
        isBookmarked,
        id,
        image,
        likes,
        tags,
        text,
        publishDate,
        owner,
      ];
}
