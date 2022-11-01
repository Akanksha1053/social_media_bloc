import 'package:equatable/equatable.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/entities/owner_entity.dart';

class PostEntity extends Equatable {
  final String id;
  final String? image;
  final int? likes;
  final List<String>? tags;
  final String? text;
  final String? publishDate;
  final OwnerEntity? owner;
  bool isBookmarked = false;

  PostEntity(
      {required this.id,
      this.image,
      this.likes,
      this.publishDate,
      this.owner,
      this.tags,
      this.text,
      isBookmarked});

  @override
  List<Object?> get props =>
      [id, image, likes, publishDate, owner, tags, text, isBookmarked];
}
