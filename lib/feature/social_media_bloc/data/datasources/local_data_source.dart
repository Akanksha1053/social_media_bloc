import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:news_app_assignment6/core/errors/failure.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/data/model/post_model.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/entities/post_entity.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/usecases/remove_bookmark_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BookMarkLocalDataSource {
  Future<Either<Failure, List<PostModel>>> getBookmarkPost();
  Future<List<PostModel>> bookmarkPost({required List<PostEntity> postList});
  Future<List<PostModel>> removeBookmark(
      {required RemoveBookmarkParam postToRemoveFromBookmark});
}

class BookMarkLocalDataSourceImpl implements BookMarkLocalDataSource {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<Either<Failure, List<PostModel>>> getBookmarkPost() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString('addPost') == null) {
      return const Right([]);
    } else {
      String json = prefs.getString('addPost')!;
      List<PostModel> decode(String json) {
        final List<PostModel> product = (jsonDecode(json) as List<dynamic>)
            .map<PostModel>((item) => PostModel.fromJson(item))
            .toList();
        return product;
      }

      return Right(decode(json));
    }
  }

  @override
  Future<List<PostModel>> bookmarkPost(
      {required List<PostEntity> postList}) async {
    final SharedPreferences prefs = await _prefs;
    String encodedData = jsonEncode(postList);
    await prefs.setString('addPost', encodedData);
    String json = prefs.getString('addPost')!;
    List<PostModel> decode(String json) {
      final List<PostModel> product = (jsonDecode(json) as List<dynamic>)
          .map<PostModel>((item) => PostModel.fromJson(item))
          .toList();
      return product;
    }

    return decode(json);
  }

  @override
  Future<List<PostModel>> removeBookmark(
      {required RemoveBookmarkParam postToRemoveFromBookmark}) async {
    final SharedPreferences prefs = await _prefs;
    String json = prefs.getString('addPost')!;
    Future<List<PostModel>> decode(String json) async {
      final product = (jsonDecode(json) as List<dynamic>)
          .map<PostModel>((item) => PostModel.fromJson(item))
          .toList();
      return product;
    }

    List<PostModel> allBookmarks = await decode(json);
    int index = allBookmarks.indexWhere((element) =>
        element.id == postToRemoveFromBookmark.postToRemoveFromBookmark.id);
    allBookmarks.removeAt(index);
    return bookmarkPost(postList: allBookmarks);
  }
}
