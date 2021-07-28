class ApiCompany {
  String? name;
  String? catchPhrase;
  String? bs;

  ApiCompany({this.name, this.catchPhrase, this.bs});

  factory ApiCompany.fromJson(Map<String, dynamic> json) => ApiCompany(
        name: json['name'] as String?,
        catchPhrase: json['catchPhrase'] as String?,
        bs: json['bs'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'catchPhrase': catchPhrase,
        'bs': bs,
      };
}
