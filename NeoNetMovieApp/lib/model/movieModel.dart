class Movies {
  String? id;
  String? title;
  int? year;
  String? poster;
  int? duration;
  DateTime? releaseDate;
  double? averageRating;

  Movies(
      {this.id,
      this.title,
      this.year,
      this.poster,
      this.duration,
      this.releaseDate,
      this.averageRating});

  Movies.fromJson(Map<String, dynamic> json) {
    id = json["_id"] ?? "ID";
    title = json["title"] ?? "Title";
    year = json["year"] ?? 0000;
    poster = json["poster"] ?? "chrome://branding/content/about-logo@2x.png";
    duration = json["duration"] ?? 0000;
    releaseDate = json["releaseDate"] != null
        ? DateTime.parse(json["releaseDate"])
        : DateTime(1);
    averageRating = json["averageRating"] != null
        ? double.parse(json["averageRating"].toString())
        : 0000;
  }
}

class MovieByID extends Movies {
  String? description;
  List<dynamic>? actors;
  List<dynamic>? categories;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  MovieByID({
    String? id,
      String? title,
      int? year,
      String? poster,
      this.description,
      int? duration,
      DateTime? releaseDate,
      double? averageRating,
      this.actors,
      this.categories,
      this.createdAt,
      this.updatedAt,
      this.v
  })
      : super(
          id: id,
          title: title,
          year: year,
          poster: poster,
          duration: duration,
          releaseDate: releaseDate,
          averageRating: averageRating,
        );

  MovieByID.fromJson(Map<String, dynamic> json) {
    id = json["_id"] ?? "ID";
    title = json["title"] ?? "Title";
    year = json["year"] ?? 0000;
    poster = json["poster"] ?? "chrome://branding/content/about-logo@2x.png";
    description = json["description"] ?? "Description";
    duration = json["duration"] ?? 0000;
    releaseDate = json["releaseDate"] != null
        ? DateTime.parse(json["releaseDate"])
        : DateTime(1);
    averageRating = json["averageRating"] != null
        ? double.parse(json["averageRating"].toString())
        : 0000;
    actors = json["actors"] ?? "Actors";
    categories = json["categories"] ?? ["Cat", "Ego", "Ries"];
    createdAt = json["createdAt"] != null
        ? DateTime.parse(json["createdAt"])
        : DateTime(1);
    updatedAt = json["updatedAt"] != null
        ? DateTime.parse(json["updatedAt"])
        : DateTime(1);
    v = json["__v"] ?? 0000;
  }
}
