class PaginatedActivity {
  final String? message;
  final Data? data;

  PaginatedActivity({
    this.message,
    this.data,
  });

  factory PaginatedActivity.fromJson(Map<String, dynamic> json) => PaginatedActivity(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  final List<Activity>? items;
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
        items: json["items"] == null ? [] : List<Activity>.from(json["items"]!.map((x) => Activity.fromJson(x))),
        prevPage: json["prev_page"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
      );
}

class Activity {
  final int? id;
  final DateTime? reportPeriodStart;
  final DateTime? reportPeriodEnd;
  final String? executionTask;
  final String? resultPlan;
  final String? actionPlan;
  final String? output;
  final String? budget;
  final String? budgetSource;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Activity({
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
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
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
      );
}
