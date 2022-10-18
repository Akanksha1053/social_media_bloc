import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/data/model/post_model.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/entities/post_entity.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/usecases/remove_bookmark_usecase.dart';

import '../../../../core/constants/url.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import 'package:http/http.dart' as http;

import '../model/stories_model.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, List<PostModel>>> getAllPosts();
  Future<Either<Failure, List<StoriesModel>>> getAllStories();
  Future<Either<Failure, List<PostModel>>> getAllData();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<Either<Failure, List<PostModel>>> getAllPosts() async {
    final url = Uri.parse(Urls.baseUrl);
    final response = await http.get(url, headers: {'app-id': Urls.appId});
    final List<PostModel> allPosts = [];
    if (response.statusCode == 200) {
      final fetchedPosts = await jsonDecode(response.body)['data'] as List;
      if (fetchedPosts.isEmpty) {
        return const Right([]);
      }
      for (var data in fetchedPosts) {
        allPosts.add(PostModel.fromJson(data));
      }
      return Right(allPosts);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, List<StoriesModel>>> getAllStories() async {
    final url = Uri.parse(Urls.baseUrl);
    final response = await http.get(url, headers: {'app-id': Urls.appId});
    List<StoriesModel> allStories = [];
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      if (data.isEmpty) {
        return const Right([]);
      }
      for (var item in data) {
        allStories.add(StoriesModel.fromJson(item['owner']));
      }
      return Right(allStories);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getAllData() async {
    final url = Uri.parse(Urls.baseUrl);
    final response = await http.get(url, headers: {'app-id': Urls.appId});
    final List<PostModel> allPosts = [];
    if (response.statusCode == 200) {
      final fetchedPosts = await jsonDecode(response.body)['data'] as List;
      if (fetchedPosts.isEmpty) {
        return const Right([]);
      }
      for (var data in fetchedPosts) {
        allPosts.add(PostModel.fromJson(data));
      }
      return Right(allPosts);
    } else {
      throw ServerException();
    }
  }
}
