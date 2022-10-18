part of 'bookmark_screen_bloc.dart';

abstract class BookmarkScreenEvent extends Equatable {
  const BookmarkScreenEvent();

  @override
  List<Object> get props => [];
}

class FetchBookMarkList extends BookmarkScreenEvent {
  const FetchBookMarkList();
}

class RemoveFromBookmarkEvent extends BookmarkScreenEvent {
  final PostEntity postToBeRemovedFromBookmark;
  const RemoveFromBookmarkEvent(this.postToBeRemovedFromBookmark);
  @override
  List<Object> get props => [postToBeRemovedFromBookmark];
}
