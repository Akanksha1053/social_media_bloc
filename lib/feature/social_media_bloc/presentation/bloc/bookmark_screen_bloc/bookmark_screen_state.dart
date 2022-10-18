part of 'bookmark_screen_bloc.dart';

abstract class BookmarkScreenState extends Equatable {
  const BookmarkScreenState();

  @override
  List<Object> get props => [];
}

class BookmarkScreenInitial extends BookmarkScreenState {}

class LoadingState extends BookmarkScreenState {}

class LoadedState extends BookmarkScreenState {
  final List<PostEntity> bookmark;

  const LoadedState({required this.bookmark});
  LoadedState copyWith({
    List<PostEntity>? bookmark,
  }) {
    return LoadedState(
      bookmark: bookmark ?? this.bookmark,
    );
  }

  @override
  List<Object> get props => [bookmark];
}

class ErrorState extends BookmarkScreenState {
  final String message;
  const ErrorState({required this.message});
}
