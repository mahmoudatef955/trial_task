import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String id;
  final String title;
  final String description;

  const Item({required this.id, required this.title, required this.description});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['\$id'],
      title: json['title'],
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [id, title, description];
}
