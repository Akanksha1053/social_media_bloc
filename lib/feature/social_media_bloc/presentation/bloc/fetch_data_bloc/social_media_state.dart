part of 'social_media_bloc.dart';

class SocialMediaState extends Equatable {
  const SocialMediaState();

  @override
  // TODO: implement props
  List<Object?> get props => [];

  // @override
  // List<Object> get props => [];
}

class InitialState extends SocialMediaState {}

class LoadingState extends SocialMediaState {}

class LoadedState extends SocialMediaState {
  final List<PostEntity> posts;
  final List<PostEntity> bookmark;

  const LoadedState({
    required this.posts,
    required this.bookmark,
  });
  LoadedState copyWith({
    List<PostEntity>? posts,
    List<PostEntity>? bookmark,
    int? selectedIndex,
  }) {
    return LoadedState(
      posts: posts ?? this.posts,
      bookmark: bookmark ?? this.bookmark,
    );
  }

  @override
  List<Object> get props => [posts, bookmark];
}

class ErrorState extends SocialMediaState {
  final String message;
  const ErrorState({required this.message});
}

abstract class Failure {}

class FetchFailure extends Failure {}
