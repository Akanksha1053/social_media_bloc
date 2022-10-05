part of 'social_media_bloc.dart';

@immutable
abstract class SocialMediaEvent {}

class FetchData extends SocialMediaEvent {}

class FetchBookMark extends SocialMediaEvent {}

class BookMark extends SocialMediaEvent {
  BookMark(this.post, this.postIdx);
  final PostData post;
  final int postIdx;
}
