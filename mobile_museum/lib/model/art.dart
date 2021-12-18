import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'art.g.dart';

@HiveType(typeId: 0)
class Art {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String beginDate = "";
  @HiveField(3)
  final String endDate = "";
  @HiveField(4)
  final String date;
  @HiveField(5)
  final String author;
  @HiveField(6)
  final String artistBio;
  @HiveField(7)
  final String artistBeginDate;
  @HiveField(8)
  final String artistEndDate;
  @HiveField(9)
  final String creditLine;
  @HiveField(10)
  final String artistNationality;
  @HiveField(11)
  final String medium;
  @HiveField(12)
  final String dimensions;
  @HiveField(13)
  String primaryImage;
  @HiveField(14)
  String description = "No description";
  //final String json;
  //final String primaryImageSmall;

  //final List<String> tags;

  Art(
      this.id,
      this.title,
      this.date,
      this.author,
      this.primaryImage,
      this.artistBio,
      this.artistBeginDate,
      this.artistEndDate,
      this.creditLine,
      this.artistNationality,
      this.medium,
      this.dimensions);

  factory Art.fromJson(Map<String, dynamic> js) {
    print("\t Responce got - ID: ${js["objectID"].toString()}");
    return Art(
        js["objectID"].toString(),
        js["title"] as String,
        js['objectDate'] as String,
        js['artistDisplayName'] as String,
        //js["primaryImage"] as String,
        js["primaryImageSmall"] as String,
        js["artistDisplayBio"] as String,
        js["artistBeginDate"] as String,
        js["artistEndDate"] as String,
        js["creditLine"] as String,
        js["artistNationality"] as String,
        js["medium"] as String,
        js["dimensions"] as String);
  }
}
