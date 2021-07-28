class ApiPost {
  int? userId;
  int? id;
  String? title;
  String? body;

  ApiPost({this.userId, this.id, this.title, this.body});

  factory ApiPost.fromJson(Map<String, dynamic> json) => ApiPost(
        userId: json['userId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        body: json['body'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
