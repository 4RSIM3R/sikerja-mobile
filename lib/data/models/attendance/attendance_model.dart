class AttendanceModel {
  final int? id;
  final int? activityId;
  final int? userId;
  final int? showInReport;
  final String? status;
  final dynamic createdAt;
  final dynamic updatedAt;
  final List<dynamic>? image;

  AttendanceModel({
    this.id,
    this.activityId,
    this.userId,
    this.showInReport,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
        id: json["id"],
        activityId: json["activity_id"],
        userId: json["user_id"],
        showInReport: json["show_in_report"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        image: json["image"] == null ? [] : List<dynamic>.from(json["image"]!.map((x) => x)),
      );
}
