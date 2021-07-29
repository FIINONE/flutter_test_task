class ApiComment {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  ApiComment({this.postId, this.id, this.name, this.email, this.body});

  factory ApiComment.fromJson(Map<String, dynamic> json) => ApiComment(
        postId: json['postId'] as int?,
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        body: json['body'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'postId': postId,
        'id': id,
        'name': name,
        'email': email,
        'body': body,
      };
}
