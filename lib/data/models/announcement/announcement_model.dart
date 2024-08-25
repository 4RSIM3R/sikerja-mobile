class PaginatedAnnouncement {
  final String? message;
  final Data? data;

  PaginatedAnnouncement({
    this.message,
    this.data,
  });

  factory PaginatedAnnouncement.fromJson(Map<String, dynamic> json) => PaginatedAnnouncement(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  final List<Announcement>? items;
  final dynamic prevPage;
  final int? currentPage;
  final dynamic nextPage;

  Data({
    this.items,
    this.prevPage,
    this.currentPage,
    this.nextPage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items:
            json["items"] == null ? [] : List<Announcement>.from(json["items"]!.map((x) => Announcement.fromJson(x))),
        prevPage: json["prev_page"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
      );
}

class Announcement {
  final int? id;
  final String? title;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? thumbnail;

  Announcement({
    this.id,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.thumbnail,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        thumbnail: json["thumbnail"],
      );
}
