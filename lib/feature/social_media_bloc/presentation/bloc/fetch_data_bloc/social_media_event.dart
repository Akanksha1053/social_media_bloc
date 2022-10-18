part of 'social_media_bloc.dart';

abstract class SocialMediaEvent extends Equatable {}

class FetchData extends SocialMediaEvent {
  FetchData();

  @override
  List<Object?> get props => [];
}

class BookMarkSharedPreferenceEvent extends SocialMediaEvent {
  BookMarkSharedPreferenceEvent(this.post, this.postIdx);
  final PostEntity post;
  final int postIdx;

  @override
  List<Object?> get props => [post, postIdx];
}
