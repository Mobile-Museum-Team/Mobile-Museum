class Art {
  final String id;
  final String title;
  final String beginDate = "";
  final String endDate = "";
  final String date;
  final String author;
  final String artistBio;
  final String artistBeginDate;
  final String artistEndDate;
  final String creditLine;
  final String artistNationality;
  final String medium;
  final String dimensions;
  String primaryImage;
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
