class SettingModel {
  final int? id;
  final String? title;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? banner;

  SettingModel({
    this.id,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.banner,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        banner: json["banner"],
      );
}
