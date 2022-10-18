import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/entities/post_entity.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/usecases/fetch_data_usecase.dart';
import '../../../domain/usecases/bookmark_usecase.dart';

import '../../../domain/usecases/remove_bookmark_usecase.dart';

part 'social_media_event.dart';
part 'social_media_state.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  final BookmarkUseCase bookmarkUseCase;

  final RemoveBookmarkUseCase removeFrombookmarkUseCase;
  final FetchDataUseCase fetchDataUseCase;
  late List<PostEntity> postList = [];
  List<PostEntity> bookmarkList = [];
  SocialMediaBloc(
    this.bookmarkUseCase,
    this.removeFrombookmarkUseCase,
    this.fetchDataUseCase,
  ) : super(InitialState()) {
    on<FetchData>(((event, emit) async {
      final fetchedData = await fetchDataUseCase.call(FetchDataListNoParams());
      fetchedData
          .fold((l) => emit(const ErrorState(message: 'unable to fetch')), (r) {
        postList = r;
        emit(LoadedState(posts: r, bookmark: bookmarkList));
      });
    }));

    on<BookMarkSharedPreferenceEvent>(((event, emit) async {
      int index = postList.indexWhere((element) => element.id == event.post.id);
      final indexOfBookmark = bookmarkList.contains(event.post);

      if (!indexOfBookmark) {
        bookmarkList.add(postList[index]);
        final bookmark =
            await bookmarkUseCase.call(BookmarkParam(postList: bookmarkList));
        bookmark.fold((l) => emit(const ErrorState(message: 'unable to add')),
            (r) {
          emit(LoadedState(posts: postList, bookmark: r));
        });
      } else {
        final removeBookmark = await removeFrombookmarkUseCase
            .call(RemoveBookmarkParam(postToRemoveFromBookmark: event.post));
        removeBookmark.fold(
            (l) => emit(const ErrorState(message: 'unable to remove')), (r) {
          bookmarkList = r;
          emit(LoadedState(posts: postList, bookmark: r));
        });
      }
    }));
  }
}
