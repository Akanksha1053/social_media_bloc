part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class SelectBottomNavigationEvent extends BottomNavigationEvent {
  const SelectBottomNavigationEvent(this.navbarItem, this.index);
  final NavbarItem navbarItem;
  final int index;
  @override
  List<Object> get props => [navbarItem, index];
}
