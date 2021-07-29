class ApiPhoto {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  ApiPhoto({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory ApiPhoto.fromJson(Map<String, dynamic> json) => ApiPhoto(
        albumId: json['albumId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        url: json['url'] as String?,
        thumbnailUrl: json['thumbnailUrl'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'albumId': albumId,
        'id': id,
        'title': title,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
      };
}
