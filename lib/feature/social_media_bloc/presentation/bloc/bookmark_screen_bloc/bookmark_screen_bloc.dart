import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/entities/post_entity.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/usecases/get_bookmark_usecase.dart';
import 'package:news_app_assignment6/feature/social_media_bloc/domain/usecases/remove_bookmark_usecase.dart';

part 'bookmark_screen_event.dart';
part 'bookmark_screen_state.dart';

class BookmarkScreenBloc
    extends Bloc<BookmarkScreenEvent, BookmarkScreenState> {
  final FetchAllBookmarksUseCase bookmarkUseCase;
  final RemoveBookmarkUseCase removeBookmarkUseCase;
  BookmarkScreenBloc(this.bookmarkUseCase, this.removeBookmarkUseCase)
      : super(BookmarkScreenInitial()) {
    on<FetchBookMarkList>((event, emit) async {
      final bookmark = await bookmarkUseCase.call(FetchBookmarkListNoParams());
      bookmark.fold((l) => emit(const ErrorState(message: 'unable to add')),
          (r) => emit(LoadedState(bookmark: r)));
    });
    on<RemoveFromBookmarkEvent>((event, emit) async {
      final removeBookmark = await removeBookmarkUseCase.call(
          RemoveBookmarkParam(
              postToRemoveFromBookmark: event.postToBeRemovedFromBookmark));
      removeBookmark.fold(
          (l) => emit(const ErrorState(message: 'unable to remove')), (r) {
        emit(LoadedState(bookmark: r));
      });
    });
  }
}
