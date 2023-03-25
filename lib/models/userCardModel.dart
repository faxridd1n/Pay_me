// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'userCardModel.g.dart';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class UserModel {
    UserModel({
        required this.ism,
        required this.kartaRaqam,
        required this.komp,
        required this.amalQilishMuddati,
        required this.id,
    });

    @HiveField(1)
    String ism;
    @HiveField(2)
    String kartaRaqam;
    @HiveField(3)
    String komp;
    @HiveField(4)
    String amalQilishMuddati;
    @HiveField(5)
    String id;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        ism: json["ism"],
        kartaRaqam: json["kartaRaqam"],
        komp: json["komp"],
        amalQilishMuddati: json["amalQilishMuddati"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "ism": ism,
        "kartaRaqam": kartaRaqam,
        "komp": komp,
        "amalQilishMuddati": amalQilishMuddati,
        "id": id,
    };
}
