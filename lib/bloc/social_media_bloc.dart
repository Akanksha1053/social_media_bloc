import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../model/post_data.dart';
import '../model/stories_data.dart';

part 'social_media_event.dart';
part 'social_media_state.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  Future<List<PostData>> _fetchPosts() async {
    final url = Uri.parse('https://dummyapi.io/data/v1/post?limit=10');
    try {
      final response =
          await http.get(url, headers: {'app-id': '633a687e1f7fbf3ab00ac9ab'});
      final List<PostData> list = [];
      final fetchedPosts = await jsonDecode(response.body)['data'] as List;

      for (var data in fetchedPosts) {
        list.add(PostData.fromJson(data));
      }
      return list;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<StoriesData>> _fetchStories() async {
    final url = Uri.parse('https://dummyapi.io/data/v1/post?limit=10');
    try {
      final response =
          await http.get(url, headers: {'app-id': '633a687e1f7fbf3ab00ac9ab'});
      final List<StoriesData> list = [];
      final fetchedStories = await jsonDecode(response.body)['data'] as List;

      for (var item in fetchedStories) {
        list.add(StoriesData.fromJson(item['owner']));
      }
      return list;
    } catch (error) {
      rethrow;
    }
  }

  SocialMediaBloc() : super(InitialState()) {
    on<FetchData>((event, emit) async {
      try {
        final fetchedPost = await _fetchPosts();
        final fetchedStories = await _fetchStories();
        emit((LoadedState(
          posts: fetchedPost,
          stories: fetchedStories,
          bookmark: [],
        )));
      } catch (error) {
        rethrow;
      }
    });
    Future<void> _addBookMark(PostData post) async {
      (state as LoadedState).bookmark.add(post);
    }

    Future<void> _deleteBookMark(PostData post) async {
      print('delete');
      (state as LoadedState)
          .bookmark
          .removeWhere((element) => element.id == post.id);
    }

    on<FetchBookMark>(
      (event, emit) {
        emit((state as LoadedState).copyWith(
          bookmark: (state as LoadedState).bookmark,
        ));
      },
    );

    on<BookMark>((event, emit) async {
      List<PostData> data = _updatePostsWithBookmark(
        (state as LoadedState).posts,
        event.postIdx,
        event.post,
      ).toList();
      data = List<PostData>.from(data).toList();
      (data[event.postIdx].isBookmarked)
          ? _addBookMark(data[event.postIdx])
          : _deleteBookMark(data[event.postIdx]);
      emit((state as LoadedState).copyWith(
          posts: data,
          stories: (state as LoadedState).stories,
          bookmark: (state as LoadedState).bookmark));
    });
  }

  List<PostData> _updatePostsWithBookmark(
      List<PostData> state, int postIdx, PostData post) {
    state[postIdx] = post.copyWith(isBookmarked: !post.isBookmarked);
    return List.from(state);
  }
}
