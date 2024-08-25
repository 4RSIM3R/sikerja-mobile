class PaginatedAssignment {
  final String? message;
  final Data? data;

  PaginatedAssignment({
    this.message,
    this.data,
  });

  factory PaginatedAssignment.fromJson(Map<String, dynamic> json) => PaginatedAssignment(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  final List<Assignment>? items;
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
        items: json["items"] == null ? [] : List<Assignment>.from(json["items"]!.map((x) => Assignment.fromJson(x))),
        prevPage: json["prev_page"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
      );
}

class Assignment {
  final int? id;
  final String? title;
  final String? number;
  final String? description;
  final DateTime? date;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? attachment;

  Assignment({
    this.id,
    this.title,
    this.number,
    this.description,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.attachment,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"],
        title: json["title"],
        number: json["number"],
        description: json["description"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        attachment: json["attachment"],
      );
}
