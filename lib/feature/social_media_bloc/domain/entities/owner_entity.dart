import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final String? id;
  final String? title;
  final String firstName;
  final String lastName;
  final String picture;

  const OwnerEntity(
      {this.id,
      this.title,
      required this.firstName,
      required this.lastName,
      required this.picture});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, firstName, lastName, picture];
}
