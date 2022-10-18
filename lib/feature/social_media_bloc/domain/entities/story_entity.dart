import 'package:equatable/equatable.dart';

class StoryEntity extends Equatable {
  final String firstName;
  final String picture;

  const StoryEntity({required this.firstName, required this.picture});

  @override
  // TODO: implement props
  List<Object?> get props => [firstName, picture];
}
