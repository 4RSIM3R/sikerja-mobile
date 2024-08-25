import 'package:next_starter/data/models/attendance/attendance_model.dart';

class PaginateActivityModel {
  final dynamic prevPage;
  final int? currentPage;
  final dynamic nextPage;
  final List<ActivityModel>? data;

  PaginateActivityModel({
    this.prevPage,
    this.currentPage,
    this.nextPage,
    this.data,
  });

  factory PaginateActivityModel.fromJson(Map<String, dynamic> json) {
    print(json["data"]["data"]);
    return PaginateActivityModel(
      prevPage: json["prev_page"],
      currentPage: json["current_page"],
      nextPage: json["next_page"],
      data: json["data"]["data"] == null
          ? <ActivityModel>[]
          : List<ActivityModel>.from(json["data"]["data"]!.map((x) => ActivityModel.fromJson(x))),
    );
  }
}

class ActivityModel {
  final int? id;
  final DateTime? reportPeriodStart;
  final DateTime? reportPeriodEnd;
  final String? executionTask;
  final String? resultPlan;
  final String? actionPlan;
  final String? output;
  final dynamic budget;
  final dynamic budgetSource;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<AttendanceModel>? attendances;

  ActivityModel({
    this.id,
    this.reportPeriodStart,
    this.reportPeriodEnd,
    this.executionTask,
    this.resultPlan,
    this.actionPlan,
    this.output,
    this.budget,
    this.budgetSource,
    this.createdAt,
    this.updatedAt,
    this.attendances,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        id: json["id"],
        reportPeriodStart: json["report_period_start"] == null ? null : DateTime.parse(json["report_period_start"]),
        reportPeriodEnd: json["report_period_end"] == null ? null : DateTime.parse(json["report_period_end"]),
        executionTask: json["execution_task"],
        resultPlan: json["result_plan"],
        actionPlan: json["action_plan"],
        output: json["output"],
        budget: json["budget"],
        budgetSource: json["budget_source"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        attendances: json["attendances"] == null
            ? []
            : List<AttendanceModel>.from(json["attendances"]!.map((x) => AttendanceModel.fromJson(x))),
      );
}
