import 'package:equatable/equatable.dart';

class StoriesData extends Equatable {
  late String firstName;
  late String picture;

  StoriesData({required this.firstName, required this.picture});

  StoriesData.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['picture'] = picture;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [firstName, picture];
}
