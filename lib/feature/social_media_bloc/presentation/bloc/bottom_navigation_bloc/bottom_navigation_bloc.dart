import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/navigation_constants.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc()
      : super(const BottomNavigationInitial(NavbarItem.home, 0)) {
    on<SelectBottomNavigationEvent>((event, emit) {
      switch (event.navbarItem) {
        case NavbarItem.home:
          emit(const BottomNavigationLoaded(NavbarItem.home, 0));
          break;
        case NavbarItem.chat:
          emit(const BottomNavigationLoaded(NavbarItem.chat, 1));
          break;
        case NavbarItem.plus:
          emit(const BottomNavigationLoaded(NavbarItem.plus, 2));
          break;
        case NavbarItem.profile:
          emit(const BottomNavigationLoaded(NavbarItem.profile, 3));
          break;
        case NavbarItem.bookmark:
          emit(const BottomNavigationLoaded(NavbarItem.bookmark, 4));
          break;
      }
    });
  }
}
