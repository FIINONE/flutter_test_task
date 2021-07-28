class ApiGeo {
  String? lat;
  String? lng;

  ApiGeo({this.lat, this.lng});

  factory ApiGeo.fromJson(Map<String, dynamic> json) => ApiGeo(
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'lat': lat,
        'lng': lng,
      };
}
