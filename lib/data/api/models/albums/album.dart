class ApiAlbum {
  int? userId;
  int? id;
  String? title;

  ApiAlbum({this.userId, this.id, this.title});

  factory ApiAlbum.fromJson(Map<String, dynamic> json) => ApiAlbum(
        userId: json['userId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'id': id,
        'title': title,
      };
}
