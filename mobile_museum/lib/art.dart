class Art {
  final String id;
  final String title;
  final String beginDate = "";
  final String endDate = "";
  final String date;
  final String author;
  String primaryImage;
  String description = "No description";
  //final String json;
  //final String primaryImageSmall;

  //final List<String> tags;

  Art(this.id, this.title, this.date, this.author, this.primaryImage);

  factory Art.fromJson(Map<String, dynamic> js) {
    print("\t Responce got - ID: ${js["objectID"].toString()}");
    return Art(
      js["objectID"].toString(),
      js["title"] as String,
      js['objectDate'] as String,
      js['artistDisplayName'] as String,
      //js["primaryImage"] as String,
      js["primaryImageSmall"] as String,
      //js["artistDisplayBio"] as String,
    );
  }
}
