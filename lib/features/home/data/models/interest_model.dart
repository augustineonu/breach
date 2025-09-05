

import 'dart:convert';

InterestModel interestModelFromJson(String str) => InterestModel.fromJson(json.decode(str));

String interestModelToJson(InterestModel data) => json.encode(data.toJson());

class InterestModel {
    final int? id;
    final Category? category;
    final User? user;

    InterestModel({
        this.id,
        this.category,
        this.user,
    });

    factory InterestModel.fromJson(Map<String, dynamic> json) => InterestModel(
        id: json["id"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category?.toJson(),
        "user": user?.toJson(),
    };
}

class Category {
    final int? id;
    final String? name;
    final String? icon;

    Category({
        this.id,
        this.name,
        this.icon,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
    };
}

class User {
    final int? id;
    final String? email;

    User({
        this.id,
        this.email,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
    };
}
