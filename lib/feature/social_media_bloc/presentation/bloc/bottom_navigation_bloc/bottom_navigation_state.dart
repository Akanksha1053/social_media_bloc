part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class BottomNavigationInitial extends BottomNavigationState {
  const BottomNavigationInitial(this.navbarItem, this.index);
  final NavbarItem navbarItem;
  final int index;

  @override
  List<Object> get props => [navbarItem, index];
}

class BottomNavigationLoaded extends BottomNavigationState {
  const BottomNavigationLoaded(this.navbarItem, this.index);
  final NavbarItem navbarItem;
  final int index;

  @override
  List<Object> get props => [navbarItem, index];
}
