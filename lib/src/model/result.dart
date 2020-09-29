import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final double downloadSpeedValue;
  final String downloadSpeedUnit;
  final double uploadSpeedValue;
  final String uploadSpeedUnit;
  final bool isDone;

  Result({
    this.downloadSpeedUnit,
    this.downloadSpeedValue,
    this.isDone,
    this.uploadSpeedUnit,
    this.uploadSpeedValue,
  });

  factory Result.fromJson(Map<dynamic, dynamic> json) {
    return Result(
      downloadSpeedUnit: json["downloadSpeedUnit"] ?? "",
      downloadSpeedValue: double.tryParse(json["downloadSpeedValue"]) ?? 0.0,
      isDone: json["isDone"] ?? false,
      uploadSpeedUnit: json["uploadSpeedUnit"] ?? "",
      uploadSpeedValue:
          double.tryParse(json["uploadSpeedValue"]).toDouble() ?? 0.0,
    );
  }

  @override
  List<Object> get props => [
        downloadSpeedUnit,
        downloadSpeedValue,
        isDone,
        uploadSpeedUnit,
        uploadSpeedValue,
      ];
}
