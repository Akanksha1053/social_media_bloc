part of 'social_media_bloc.dart';

class SocialMediaState {
  const SocialMediaState();

  // @override
  // List<Object> get props => [];
}

class InitialState extends SocialMediaState {
  final int selectedIndex;
  InitialState(this.selectedIndex);
}

class LoadingState extends SocialMediaState {}

class LoadedState extends SocialMediaState {
  final List<PostData> posts;
  final List<StoriesData> stories;
  final List<PostData> bookmark;
  final int selectedIndex;
  const LoadedState(
      {required this.posts,
      required this.stories,
      required this.bookmark,
      required this.selectedIndex});
  LoadedState copyWith({
    List<PostData>? posts,
    List<StoriesData>? stories,
    List<PostData>? bookmark,
    int? selectedIndex,
  }) {
    return LoadedState(
        posts: posts ?? this.posts,
        stories: stories ?? this.stories,
        bookmark: bookmark ?? this.bookmark,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }

  @override
  List<Object> get props => [posts, stories, bookmark, selectedIndex];
}

class ErrorState extends SocialMediaState {
  final String message;
  const ErrorState({required this.message});
}

abstract class Failure {}

class FetchFailure extends Failure {}
