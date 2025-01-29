import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final String? image;
  final String? name;
  final String? comment;

  const Comment({this.image, this.name, this.comment});

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        image: json['image'] as String?,
        name: json['name'] as String?,
        comment: json['comment'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'name': name,
        'comment': comment,
      };

  @override
  List<Object?> get props => [image, name, comment];
}
