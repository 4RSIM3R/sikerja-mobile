class PaginatedAttendance {
  final String? message;
  final Data? data;

  PaginatedAttendance({
    this.message,
    this.data,
  });

  factory PaginatedAttendance.fromJson(Map<String, dynamic> json) => PaginatedAttendance(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  final List<Attendance>? items;
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
        items: json["items"] == null ? [] : List<Attendance>.from(json["items"]!.map((x) => Attendance.fromJson(x))),
        prevPage: json["prev_page"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
      );
}

class Attendance {
  final int? id;
  final int? userId;
  final String? workHour;
  final String? latitude;
  final String? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? photo;

  Attendance({
    this.id,
    this.userId,
    this.workHour,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.photo,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        id: json["id"],
        userId: json["user_id"],
        workHour: json["work_hour"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        photo: json["photo"],
      );
}
