class SettingModel {
  final int? id;
  final String? applicationName;
  final String? applicationVersion;
  final String? applicationDescription;
  final String? startWorkingHour;
  final String? gracePeriodMinutes;
  final String? chiefName;
  final String? chiefNip;
  final String? latitude;
  final String? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SettingModel({
    this.id,
    this.applicationName,
    this.applicationVersion,
    this.applicationDescription,
    this.startWorkingHour,
    this.gracePeriodMinutes,
    this.chiefName,
    this.chiefNip,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        id: json["id"],
        applicationName: json["application_name"],
        applicationVersion: json["application_version"],
        applicationDescription: json["application_description"],
        startWorkingHour: json["start_working_hour"],
        gracePeriodMinutes: json["grace_period_minutes"],
        chiefName: json["chief_name"],
        chiefNip: json["chief_nip"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );
}
