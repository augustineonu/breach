import 'package:breach/features/home/data/models/category_model.dart';

class PostModel {
  final int id;
  final String title;
  final String content;
  final String imageUrl;
  final DateTime createdAt;
  final Author author;
  final CategoryModel category;
  final Series? series;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.createdAt,
    required this.author,
    required this.category,
    this.series,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      author: Author.fromJson(json['author']),
      category: CategoryModel.fromJson(json['category']),
      series: json['series'] != null ? Series.fromJson(json['series']) : null,
    );
  }
}

class Author {
  final int id;
  final String name;

  Author({required this.id, required this.name});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Series {
  final int id;
  final String name;

  Series({required this.id, required this.name});

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['id'],
      name: json['name'],
    );
  }
}
