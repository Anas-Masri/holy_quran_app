import 'dart:convert';

class AzkarModel {
  int? id;
  String? category;
  String? audio;
  String? filename;
  List<SubAzkar>? array;

  AzkarModel({
    this.id,
    this.category,
    this.audio,
    this.filename,
    this.array,
  });

  factory AzkarModel.fromRawJson(String str) =>
      AzkarModel.fromJson(json.decode(str));
  static List<AzkarModel> listFromRawJson(String str) => List<AzkarModel>.from(
      json.decode(str).map((x) => AzkarModel.fromJson(x)));

  String toRawJson() => json.encode(toJson());

  factory AzkarModel.fromJson(Map<String, dynamic> json) => AzkarModel(
        id: json["id"],
        category: json["category"],
        audio: json["audio"],
        filename: json["filename"],
        array: json["array"] == null
            ? []
            : List<SubAzkar>.from(
                json["array"]!.map((x) => SubAzkar.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "audio": audio,
        "filename": filename,
        "array": array == null
            ? []
            : List<dynamic>.from(array!.map((x) => x.toJson())),
      };
}

class SubAzkar {
  int? id;
  String? text;
  int? count;
  String? audio;
  String? filename;

  SubAzkar({
    this.id,
    this.text,
    this.count,
    this.audio,
    this.filename,
  });

  factory SubAzkar.fromRawJson(String str) =>
      SubAzkar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubAzkar.fromJson(Map<String, dynamic> json) => SubAzkar(
        id: json["id"],
        text: json["text"],
        count: json["count"],
        audio: json["audio"],
        filename: json["filename"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "count": count,
        "audio": audio,
        "filename": filename,
      };
}
