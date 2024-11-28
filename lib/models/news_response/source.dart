class Source {
  final String? id;
  final String? name;

  const Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
